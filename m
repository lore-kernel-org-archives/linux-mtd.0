Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5Tkb-0001SY-Ez
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 22:20:28 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id lBKMJwpo029853
	for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2007 17:19:58 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	lBKMJwwv491158
	for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2007 17:19:58 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	lBKMJvBf013969
	for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2007 17:19:58 -0500
Date: Thu, 20 Dec 2007 16:14:22 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
Message-ID: <20071220161422.1f08a610@zod.rchland.ibm.com>
In-Reply-To: <200712202234.56859.arnd@arndb.de>
References: <20071219154137.23264.28116.sendpatchset@golum>
	<200712191657.24027.arnd@arndb.de>
	<1198086060.18962.120.camel@sauron>
	<200712202234.56859.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Frank Haverkamp <haver@vnet.ibm.com>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Dec 2007 22:34:56 +0100
Arnd Bergmann <arnd@arndb.de> wrote:
> > > You can have a simple attribute named 'ubi-probe' in each MTD device in sysfs.
> > 
> > Err, why should MTD know something about what sits on top of it? Today
> > it is UBI, tommorrow it is something new and better, e.g., more
> > scalable.
> 
> The way you would implement this is to have the UBI code grab hold of all
> the MTD devices, and create the ubi-probe attribute in them. This is
> something that is easily possible with the device model, provided that
> we can get a 'struct device' embedded into 'struct mtd_info'. I just realized
> that this is currently missing.

You could.  Aside from this current discussion, what good would it do
though?

> > So MTD maintains ubi-probe attribute, and has some knowlege about UBI.
> > Well, it is technically possible, but I do not think it would be good
> > design. The same way we could teach MTD to probe if it has JFFS2 on it,
> > or something else...
> 
> The probe on a JFFS2 formatted device is called 'mount', and we have a
> perfectly fine system call interface for that ;-)

That's not a good analogy.  MTD still has absolutely no idea what is on
top of it.
 
> > Yeah, user-space tools could format media. But it is so much appropriate
> > facility to have UBI being able to format it itself. It is really very
> > convenient. Flashes have special state - empty flash, and if the flash
> > is empty - UBI make it UBI-formatted. If the flash has some garbage -
> > UBI does not format it. 
> 
> Ok, another idea: just create an UBI device for every MTD device, but don't
> probe until the UBI device is first accessed. That way, you don't need
> any dynamic registration, and you can use an ioctl on the device itself
> in order to do the initial formatting with new parameters.

Why would you carry the memory overhead for those devices if they're
never going to be used?

josh
