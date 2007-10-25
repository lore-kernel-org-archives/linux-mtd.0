Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IlAOE-0001y1-0L
	for linux-mtd@lists.infradead.org; Thu, 25 Oct 2007 22:37:22 +0100
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'Linux-MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: RE: getdents64 problem in 2.6.23
Date: Thu, 25 Oct 2007 23:36:51 +0200
Message-ID: <01ff01c8174f$27cd99a0$5267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1193233660.23075.31.camel@gentoo-jocke.transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org 
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of 
> Joakim Tjernlund
> Sent: den 24 oktober 2007 15:48
> To: Linux-MTD Mailing List
> Subject: getdents64 problem in 2.6.23
> 
> started to use 2.6.23 in our development system a few days ago and
> now I got problems when deleting files from a large directory 
> structure.
> A rm -rf does not delete all files.
> 
> Did a strace and found that some files does not appear in the
> strace, the same ones that doesn't get deleted.
> 
> The files that remain are in two directories:
> 
> ./doc/images:
> enm_topleft.gif*
> h_10g.gif*
> h_cu.gif*
> h_cuSfp.gif*
> h_fpuym.gif*
> h_mdu4T2F.gif*
> h_mxp16.gif*
> h_oaMon.gif*
> h_oiu50.gif*
> h_qmr.gif*
> h_unexp_half.gif*
> saveHoover.gif*
> saveHooverWarn.gif*
> showNormal.gif*
> tab_sel.gif*
> top-bar.jpg*
> v_d10gbe.gif*
> v_empty.gif*
> v_gbemxp.gif*
> v_mdu40.gif*
> v_mdu4E.gif*
> v_mdu4T.gif*
> v_mdu8E.gif*
> v_mdu8T.gif*
> v_oa2Mon.gif*
> v_sync.gif*
> v_unexp.gif*
> v_voa.gif*
> wizard_logo.gif*
> 
> ./lib:
> liblum_mib_help_text_if.so.1@
> libmgmt_mibserver_if.so.1@
> libtsiif.so.1.0.0
> 
> looking at the strace a bit futher reveals:
> 
> open("cuappl02a-r10a-071024_yyy/doc/images", O_RDONLY|O_NONBLOCK|
> O_LARGEFILE|O_DIRECTORY) = 5
> fstat64(5, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> fcntl64(5, F_SETFD, FD_CLOEXEC)         = 0
> getdents64(5, /* 119 entries */, 4096)  = 4064
> lstat64("cuappl02a-r10a-071024_yyy/doc/images/v_roadm.gif",
> {st_mode=S_IFREG|0755, st_size=2717, ...}) = 0
> unlink("cuappl02a-r10a-071024_yyy/doc/images/v_roadm.gif") = 0
> lstat64("cuappl02a-r10a-071024_yyy/doc/images/h_du.gif",
> {st_mode=S_IFREG|0755, st_size=1632, ...}) = 0
> unlink("cuappl02a-r10a-071024_yyy/doc/images/h_du.gif") = 0
> ....
> getdents64(5, /* 0 entries */, 4096)    = 0
> close(5)                                = 0
> 
> Notice the last getdents64 returning 0, I think this is wrong as there
> is more the 119 files in this directory.
> 
>  Jocke

David, could you comment? I need some advice on how to proceed.

 Jocke
