Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXXHP-0002wr-9W
	for linux-mtd@lists.infradead.org; Fri, 07 Mar 2008 07:46:13 +0000
Subject: Re: Powerfail-tests and jffs2-sync-mount
From: "Schlaegl Manfred jun." <manfred.schlaegl@gmx.at>
To: dedekind@infradead.org
In-Reply-To: <1204870246.23706.53.camel@sauron>
References: <1204821719.3426.33.camel@lisa.alm.archives.at>
	<1204870246.23706.53.camel@sauron>
Content-Type: text/plain; charset=ISO-8859-1
Date: Fri, 07 Mar 2008 08:45:55 +0100
Message-Id: <1204875955.3476.13.camel@lisa.alm.archives.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am Freitag, den 07.03.2008, 08:10 +0200 schrieb Artem Bityutskiy:
> On Thu, 2008-03-06 at 17:41 +0100, Schlägl Manfred jun. wrote:
> > Hi!
> > 
> > I did some powerfail-testing of jffs2. 
> > 
> > Short overview (Contact me for details):
> > Arch: ARM926EJ-S with 40MB rw jffs2 part on Samsung NAND-Flash
> > Kernel: linux-2.6.12 (a little bit out of date, i know ;-))
> > Test: 
> >  * Target-Loop
> >    * filesystem-consistency:
> >      * create dir
> >      * copy data(> eraseblock-size) to new file
> >      * delete a file
> >    * file-consistency:
> >      * logfile on jffs-part (simply appending text with echo)
> >  * External random-time reset:
> >    * external uC
> >    * generates reset every 120+rand(0..30) seconds
> >  * Run until no more space on filesystem
> > Results:
> >  * test with sync-mounted jffs2 (mount -o sync):
> >    * duration 4:40 hours
> >    * 131 generated resets
> >    * consistent FS
> >    * consistent logfile
> >  * test with async mounted jffs2:
> >    * duration 4:10 hours
> >    * 118 generated resets
> >    * consistent FS
> >    * corrupted logfile (bad-chars, etc.)
> > 
> > Now my question: Are there any non-obvious disadvantages, mounting jffs2
> > synchronal, except lower speed and a little(depends on usage) decreased
> > flash-life-time (wear-out), or is this anyway the default approach?
> 
> My understanding of the things is that this should not really matter. I
> thought if you have some corruption in asynchronous mode, you should
> have them in synchronous too, may its worth trying more synchronous mode
> testing?
> 
I thought it's a matter of file-buffers between the file-operations and
jffs2, but these buffer should be flushed on close of the file, so there
should be no problem with echo.
I think i've to take a look on vfs, perhaps there is some buffering, or
(even worst) some reodering of actions.

Currently i've to do some other tests (bootloader bad-block-handling).
After that I will work on some methodes to keep different
files-types(config-files, log-files, ...) conistent in case of
powerfail. So I will do some further tests on saturday or thursday.

Best regards,
        Manfred Schlaegl
