Received: from web30203.mail.mud.yahoo.com ([209.191.69.50])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pntrs-0007MI-D7
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:21:05 +0000
Message-ID: <571902.81856.qm@web30203.mail.mud.yahoo.com>
Date: Fri, 11 Feb 2011 06:21:02 -0800 (PST)
From: Lars Michael <lars.michael@yahoo.com>
Subject: mount ubi volume fails: No such device
To: linux-mtd@lists.infradead.org
In-Reply-To: <9186EF1D8AB86E40B9C8009D36864D0403CA4342@dhreinsvxb03.messaging.danaherad.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > On Mon, 2011-02-07 at 07:05 -0800, Lars Michael=0A> wrote:=0A> > > UBI:=
 scrubbed PEB 863, data moved to PEB 1097 UBI=0A> warning:=0A> > ubi_eba_co=
py_leb: read data back from PEB 1092 and it=0A> is different UBI=0A> > erro=
r: wear_leveling_worker: error -22 while moving=0A> PEB 868 to PEB=0A> 1092=
=0A> > UBI warning: ubi_ro_mode: switch to read-only mode UBI=0A> error: do=
_work:=0A> > work failed with error code -22 UBI error: ubi_thread:=0A> ubi=
_bgt0d: work=0A> > failed with error code -22=0A> > =0A> > It says you that=
 it wrote some date, then read it=0A> back, compared, and=0A> > the data di=
d not match. You need to start with=0A> validating your falash=0A> > driver=
s - use mtd tests:=0A> > =0A> > http://www.linux-mtd.infradead.org/doc/gene=
ral.html#L_mtd_tests=0A> > =0A> =0A> I formatted and wrote the image again.=
 ubiattach=0A> _sometimes_ completes=0A> without the error code -22. In thi=
s case the mount went ok.=0A> But mount=0A> sometimes fails completely (str=
ucture needs cleaning),=0A> other times=0A> errors are reported but success=
fully recovered. So it seems=0A> to work, but=0A> no in=0A> a reliable way.=
 Any suggestions on how to improve it? My=0A> kernel is=0A> 2.6.29 so perha=
ps some patches are needed?=0A> =0A=0ASo I got 167 patches from the ubifs 2=
.6.29 back port tree, some of them=0Alooking very relevant. I did manage to=
 format, attach and mount once, but it appears very unstable reporting more=
 and more errors, like:=0A=0AUBI warning: process_eb: valid VID header but =
corrupted EC header at PEB 959=0A=0AUBI error: check_corruption: PEB 1065 c=
ontains corrupted VID header, and the data does not contain all 0xFF, this =
may be a non-UBI PEB or a severe VID header corruption which requires manua=
l inspection=0A=0AI will make a new post with more details, using another m=
ail client that dont screw the header info.=0A=0A=0A      
