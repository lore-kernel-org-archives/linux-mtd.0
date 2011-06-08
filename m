Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJXa-0005Lq-Bq
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:15:27 +0000
Received: by wwb39 with SMTP id 39so437442wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:15:24 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTikKVMQFxtE0S1VL4-SUPWNydgexLw@mail.gmail.com>
References: <1307377091.3112.100.camel@localhost>
	<1307389926-12209-1-git-send-email-mlcreech@gmail.com>
	<1307421266.11104.10.camel@localhost>
	<BANLkTikKVMQFxtE0S1VL4-SUPWNydgexLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 17:11:05 +0300
Message-ID: <1307542265.31223.97.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 16:41 -0400, Matthew L. Creech wrote:
> On Tue, Jun 7, 2011 at 12:34 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > No, I have difficulties reading hexdumps. You have set of good nodes
> > following by one broken node. I wanted to see a human-readable dump of
> > the good nodes at the beginning of the LEB.
> >
> 
> Oh I see - sorry, I thought you wanted to debug the corrupted portion.
> 
> Here's the output for my corrupt flash:
> 
> http://mcreech.com/work/ubifs-2011-06-07.txt
> 
> I'll follow up with a patch.

Yes, it does look like this LEB might be garbage-collected. But it does
not have to be.

Anyway, what I can suggest you is to do several things.

1. If you have many occasions of such error, try to gather some
   information about how the device was used, and if it was uncleanly
   power-cut. Remember, I often saw that embedded devices have incorrect
   reboot. Whe users reboot it "normally" - it does not try to unmount
   the FS-es cleanly and just jumps to som HW reset function.

   You can verify this by rebooting normally and checking if UBIFS says
   "recovery needed" or not. If it does - the reboot was not normal.

2. This error may be due to memory corruptions in some driver (e.g.,
   wireless or video), due to issues in the mtd driver, etc. Try to
   stress your system with slub/slab full checks enabled, and other
   debugging features which you can find in the "hacking" section of
   make menuconfig.

3. If my theory is true, then what may help is adding a check it
   ubifs recovery function. The recovery ends with an ubifs_leb_change()
   call. You need to check the last node there - is it full and correct?
   If not, you should print a loud warning and information like leb dump
   _before_ the change, and dump of the buffer which we are going to
   write with ubifs_leb_change().

   You'd probably need to deploy this check to the field if this issue
   is not easy to reproduce. If you have then this info you may fix the
   bug.

4. Set-up power-cut emulation testing in your office.

P.S. I'm curious where you use UBIFS, if this is not a trade secret, of
course.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
