Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2j6g-0001pa-Mx
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 15:07:15 +0000
Message-ID: <1389625608.2259.357.camel@sauron.fi.intel.com>
Subject: Re: UBIFS seeing corrupt blank pages when image flashed via u-boot
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Mon, 13 Jan 2014 17:06:48 +0200
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA61199@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
 <1388753970.25123.124.camel@sauron.fi.intel.com>
 <CAEhpT-W-aBkackmUb860vex2LxGzkBQ6hu1KGvUzjmTWTeQgxg@mail.gmail.com>
 <1389617894.2259.270.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA61199@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "Stefan Roese <sr@denx.de> \(sr@denx.de\)" <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Calvin Johnson <linux.cj@gmail.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-01-13 at 13:16 +0000, Gupta, Pekon wrote:
> Currently both UBI and UBIFS layer checks for erased-page to be
> all(0xff),
> But I think its over-kill to put this burden on UBI or UBIFS layer,
> because
> low-level controller drivers can handle this easily.
> So, if Artem and Brian agree to above approaches, then I can a submit
> patch
> for removal of:
>  - "ubi_self_check_all_ff()" from UBI layer.

Well, this is just debugging and sanity check stuff.

>  - checking of 'buf == 0xff' from ubifs_scan_leb() in UBIFS layer.

I do not think this is a good idea. Let me do some quick braindump,
thankfully I still remember the reasons behind this.
> 
This is about the recovery, and this is the code path where we actually
do these checks.

Just like in defensive programming you try to assume the worst, we tried
to assume the worst too. And the worst is - you cannot make any
assumption about what is on the media.

Now, we wanted to make UBIFS robust in a sense that you can cut the
power off at any point, and you can be sure the UBIFS driver is still
able to mount your flash. You can lose some data because it did not make
it to the media yet by the time of power cut. But you never lose the
data which made it to the media before the power cut.

And the file-system should mount the media without any user-space tools
like 'ckfs.ubifs'. The system should recover itself (detect half-written
garbage and get rid of it, preparing "clean" blank flash area for
writing new data).

When you mount a file-system, UBIFS scans the journal. Suppose it hits a
corrupted data node. At this point UBIFS need to make a decision whether
this is a node which was corrupted because of a power cut, or this is a
piece of data which has to be correct, but got corrupted because of,
say, under-voltage problems, or NAND wear, or radiation, etc.

In the first case - you recover silently, and you do not bother the user
with warnings.

In the second case - you report loudly. You do not do anything because
you risk of losing important user data (an expensive bitcoin!)

Right? So you gotta be very careful, because this is user data.

To put it differently, we specifically targeted a special type of
corruptions - power-cut related corruptions. We made related
assumptions. And we were very careful about validating these
assumptions.

So UBIFS always starts with fully erased LEBs. Then it writes there
sequentially, NAND page-by-page, from beginning to the end.

(Well, it is a bit more complex than that, but this is not important in
this discussion. The complexity is that there are several journal heads,
so UBIFS writes to more than one LEBs, but it is sequetial anyway. Also,
we write in so-called "max. write units", which are usually the same as
NAND page in case of NAND anyway).

When UBIFS mounts a file-system, it scans the journal. When it meets a
corrupted node in NAND page X, it looks at NAND page X+1 and checks if
it is blank or not. If it is blank, this looks normal, and X was just
the NAND page UBIFS presumably was writing to just before the power cut.

If NAND page X+1 contains something, then page X cannot be corrupted due
to power cut, and this is something else. And we, the FS authors, do not
know how to deal with this, we did not think about this type of
corruptions. So just we complain and exit. This is better then trying to
erase something and make you lose your data, right?

That's the logic. And of course people are welcome to extend it and
improve it.

Conclusion: all UBIFS needs is a way to ask the driver - is this NAND
page blank or not? UBIFS does not really has to compare to all 0xFFs.

-- 
Best Regards,
Artem Bityutskiy
