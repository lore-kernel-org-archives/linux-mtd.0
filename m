Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUMte-0001nm-Os
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 17:50:27 +0000
Received: by vws8 with SMTP id 8so724255vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 10:50:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307542265.31223.97.camel@localhost>
References: <1307377091.3112.100.camel@localhost>
	<1307389926-12209-1-git-send-email-mlcreech@gmail.com>
	<1307421266.11104.10.camel@localhost>
	<BANLkTikKVMQFxtE0S1VL4-SUPWNydgexLw@mail.gmail.com>
	<1307542265.31223.97.camel@localhost>
Date: Wed, 8 Jun 2011 13:50:24 -0400
Message-ID: <BANLkTimXGmANdV663BP2CLKZTJyzD+QLhQ@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 10:11 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
>
> Yes, it does look like this LEB might be garbage-collected. But it does
> not have to be.
>
> Anyway, what I can suggest you is to do several things.
>
> 1. If you have many occasions of such error, try to gather some
> =A0 information about how the device was used, and if it was uncleanly
> =A0 power-cut. Remember, I often saw that embedded devices have incorrect
> =A0 reboot. Whe users reboot it "normally" - it does not try to unmount
> =A0 the FS-es cleanly and just jumps to som HW reset function.
>
> =A0 You can verify this by rebooting normally and checking if UBIFS says
> =A0 "recovery needed" or not. If it does - the reboot was not normal.
>

Yes, it currently reboots uncleanly (though it does do a "sync"
first).  I noticed this a while back, and the next release firmware
will have it fixed.  However, it doesn't make a huge difference to us,
because these devices are probably more likely to experience power
loss than a software reboot, in the field at least.

> 2. This error may be due to memory corruptions in some driver (e.g.,
> =A0 wireless or video), due to issues in the mtd driver, etc. Try to
> =A0 stress your system with slub/slab full checks enabled, and other
> =A0 debugging features which you can find in the "hacking" section of
> =A0 make menuconfig.
>

Will do.

> 3. If my theory is true, then what may help is adding a check it
> =A0 ubifs recovery function. The recovery ends with an ubifs_leb_change()
> =A0 call. You need to check the last node there - is it full and correct?
> =A0 If not, you should print a loud warning and information like leb dump
> =A0 _before_ the change, and dump of the buffer which we are going to
> =A0 write with ubifs_leb_change().
>
> =A0 You'd probably need to deploy this check to the field if this issue
> =A0 is not easy to reproduce. If you have then this info you may fix the
> =A0 bug.
>

Great, I'll add this check and see if we get any hits.  Even if it
takes a while to hit it in the field, this would at least give us a
way to make some progress in finding the issue.

> 4. Set-up power-cut emulation testing in your office.
>

I did this at one point - I have a programmable UPS, so I was able to
automate a test to turn outlet power off & on repeatedly while having
the device do some work.  It didn't seem to help reproduce the
problem, but it's worth trying again on a long-term basis (especially
with the change above to try & catch the corruption in the act).

Thanks again Artem.

--=20
Matthew L. Creech
