Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWabq-0005e1-82
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 01:43:39 +0000
Received: by paczk9 with SMTP id zk9so9491612pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 18:43:17 -0700 (PDT)
Date: Mon, 31 Aug 2015 18:43:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Richard Weinberger <richard@nod.at>,
 Bhuvanchandra DV <bhuvanchandradv@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: UBIFS errors when file-system is full
Message-ID: <20150901014315.GF81844@google.com>
References: <55AF4447.50500@nod.at> <55B24F2F.9020705@gmail.com>
 <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55BC68D6.2070008@nod.at> <55C3379E.50000@gmail.com>
 <55C4A695.7060608@nod.at>
 <e3d338cfd875b941061d5ac3da9f29c0@agner.ch>
 <55CAF568.5090704@nod.at>
 <812d355821f585decf92a66628caef7b@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <812d355821f585decf92a66628caef7b@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,

On Mon, Aug 31, 2015 at 05:45:47PM -0700, Stefan Agner wrote:
> On 2015-08-12 00:27, Richard Weinberger wrote:
> > Am 12.08.2015 um 09:01 schrieb Stefan Agner:
> >> [also added Brian to the discussion, since he had a look into that
> >> driver before]
> > 
> > Good idea, maybe Brian has an idea.

Sorry, didn't look until now.

> >> I worked on the driver since quite some time, currently v10 is in
> >> review. With this issue in mind, I went through the driver however I
> >> currently can't see an issue.
> >>
> >> The error position is always page aligned, but at different pages. We
> >> printed the reread buffers once: It seems that one page lands on flash
> >> twice. My guess is that the second page doesn't get transmitted
> >> properly, while the new column/row gets transmitted and
> >> NAND_CMD_PAGEPROG executed... Hence the same buffer would be written to
> >> the device again.
> >>
> >> The NFC IP in Vybrid (vf610) has a higher level programming model which
> >> takes care of the command sequencing. Therefore some callbacks are not
> >> actually sending a command to the device (e.g. NAND_CMD_SEQIN) since
> >> this will be done one command later, on in NAND_CMD_PAGEPROG. Now, of
> >> course, the driver relies heavily on not being interrupted by other
> >> requests in between, (also not read!) but I thought that this is taken
> >> care of by the MTD subsystem? So for me it is a bit hard to spot the
> >> error since I'm always unsure whether the assumptions regarding
> >> locking/exclusiveness between the calls is really guaranteed...
> > 
> > NAND access is serialized using nand_get_device() and nand_release_device()
> > in nand_base.c, so serialization should be fine.

Right, on a macro level. But I suspect you may have serialization
problems within your driver routines themselves. See below.

> I did some more testing with v11 of this driver, and it seems when I
> continuously reset the system, I get read errors from time to time. The
> read errors end up in various errors, I have seen ubifs_read_node: bad
> node type or ubifs_tnc_read_node: bad key in node. However, particularly
> often and interesting are ubifs_decompress: cannot decompress errors,
> such as this one. It seems that same page is read twice (or has been
> written twice, see data pattern at offset 0x00000000 and 0x00000800).
> 
[...]
> 
> I checked the code regarding glitches on read/write side which could
> lead to page number not getting updated or something along this line, so
> far I could not nail the issue.
> 
> Brian, with the pattern above in mind, do you see possible issues in the
> driver?

I don't have any particular knowledge about that pattern. Regarding
patterns, I've mostly been worried about incomplete "check for 0xff"
algorithms. Doesn't seem to be relevant here.

I don't know too much of this IP other than what I glean from general
NAND code review. With that in mind, this snippet does look a bit
suspect:

+static void vf610_nfc_done(struct vf610_nfc *nfc)
+{
+	unsigned long timeout = msecs_to_jiffies(100);
+
+	/*
+	 * Barrier is needed after this write. This write need
+	 * to be done before reading the next register the first
+	 * time.
+	 * vf610_nfc_set implicates such a barrier by using writel
+	 * to write to the register.
+	 */
+	vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
+	vf610_nfc_set(nfc, NFC_FLASH_CMD2, START_BIT);
+
+	if (!(vf610_nfc_read(nfc, NFC_IRQ_STATUS) & IDLE_IRQ_BIT)) {

^^^ this line

+		if (!wait_for_completion_timeout(&nfc->cmd_done, timeout))
+			dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");
+	}
+	vf610_nfc_clear_status(nfc);
+}

Why do you actually need to check the idle bit? If you need to read it
to clear out some FIFO, then that's fine -- just read it, but don't use
it as a second condition. The complete()/wait_for_completion()
synchronization should be sufficient on its own. (If not, then I think
you have other problems.)

The NFC_IRQ_STATUS-based condition looks like it could lead to races
because your interrupt may fire between setting and checking
the idle bit. So the IRQ handler will increment the completion struct
(cmd_done), but you *won't* be doing the corresponding decrement via
wait_for_completion(). If you don't do that... then the subsequent
wait_for_completion() will immediately succeed.

Anyway, that's a quick and possibly disorganized explanation of my
initial thoughts. Let me know if you
(1) don't understand me;
(2) disagree; or
(3) have tested my suggested fix and still see the behavior.

I can take another look if we're on to option (2) or (3) :)

Regards,
Brian
