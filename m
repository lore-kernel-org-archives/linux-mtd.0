Received: from creative.actrix.co.nz ([203.96.26.135])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nIAS-0003eG-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 11:52:41 +0000
Received: from there (203-96-30-48-adsl.actrix.co.nz [203.96.30.48])
	by creative.actrix.co.nz (Postfix) with SMTP id 645F21255
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 00:01:09 +1200 (NZST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: linux-mtd@lists.infradead.org
Subject: Re: How to protect DoC 2000 from power fail?
Date: Tue, 19 Mar 2002 23:57:39 +1200
References: <3C95D945.2DCE55AA@wtms.nl> <30525.1016457013@redhat.com>
In-Reply-To: <30525.1016457013@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020319120109.645F21255@creative.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 19 Mar 2002 01:10, David Woodhouse wrote:
> wil@wtms.nl said:
> >  I am looking for some rigid means of power fail protection for a DoC
> > 2000 based embedded system. From what I have read so far I understand
> > that almost any brand of journalling file system should do well but,
> > then again, those readings also mention raw FLASH and not DoC, in
> > other words, I think I am lost. Would someone be so kind to enlighten
> > me?
>[snip]
> CompactFlash also uses such a pseudo-filesystem, but does it completely
> internally. Electrically, it behaves just like an IDE drive. Reportedly CF
> devices are very bad w.r.t to power failure and wear levelling though, but
> the concept is similar.


CF should have at least 15ms of good power after the last write. This is 
required to complete the write internally.

Dunno what goes on in a DOC, but basically it needs some power to complete 
the last write. Dunno how clever it is at fixing itself. Maybe read the 
msystems www. They have some good application notes - maybe one covers these 
issues.

Hard disks get around the power issue by using the inertia of the spinning 
disk to generate sufficient power (well that's what I believe anyway). No 
such luxury with flash. You either need a resiliant file system - preferably 
one designed specifically for flash - or some way to guarantee power to 
complete a shutdown.

I've done both in various situations.

One way to guarantee good power into the FS is to do something like follows:
* Have the hardware report an early warning of imminent power failure. eg. if 
you have a two-stage switchmode, detecting the regulation loss flag on the 
first stage might do the job.
* Protect all critical FS entry points with power checks:
   write_func()
   {
      while(power is bad) { /* spin */}
      rest of function
   }
*  If you've done this right, you never go into a critical section with bad 
power. If power turns bad during the run of the function then hopefully the 
residual energy in the rail etc will be enough to power the system through 
the rest of the function call.

This can work well if your hardware supports this kind of detection and has 
sufficient residual energy. Dunno how long you need for a DOC, but I would 
hunch that 100ms would be enough.


> If you want to be able to write to it then the correct solution, IMO, is to
> write a _real_ file system which operates on flash directly instead of
> operating on a block device. Build in the wear levelling, journalling, etc.

Too right!

-- Charles
