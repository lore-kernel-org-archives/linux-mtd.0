Received: from a.ns.innominate.com ([212.21.76.70] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17CgoP-0002JT-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 May 2002 14:14:53 +0100
From: tkeitel@innominate.com
Date: Tue, 28 May 2002 15:09:07 +0200
To: linux-mtd@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: Append does not return error on full disks
Message-ID: <20020528150907.A28385@gateway.bln.gelonet.local>
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF72@mail.mediatrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF72@mail.mediatrix.com>; from fgiasson@mediatrix.com on Tue, May 28, 2002 at 08:30:03AM -0400
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

On Tue, May 28, 2002 at 08:30:03 -0400, Frederic Giasson wrote:
> Hi,
> 
> 	I have observed that jffs2 nevers returns a 'disk full' error when
> an application appends data to an existing file.  I have setup a test which
> opens an existing file for appending, and fwrite() data to it until fwrite()
> returns error.
> My test never stopped!  So when I manually stoppped it, the file system was
> corrupted.  I was unable to unmount it, and neither I could remount it after
> reboot.  I have setup a second test which is a script instead of being a
> program, using the append '>>' command.  Same results. 
> 
> 	During my test, I did'nt open the file with OSYNC flag though, maybe
> it could patch the problem.  I will try it.
> Nevertheless, it shouldn't happen that a process be able to append data
> indefinitely to a file without ever getting an error when the disk becomes
> full.
> 
> 	Does anyone have a clue about it?  Maybe there is a bug somewhere
> down in the jffs2_reserve_space() function?
> 

What version of JFFS2 did you use?

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
