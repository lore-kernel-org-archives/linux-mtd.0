Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HtINO-0002HZ-BT
	for linux-mtd@lists.infradead.org; Wed, 30 May 2007 03:13:48 -0400
Subject: Re: Some issues with the AT91 dataflash driver...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20070529222744.3e7a1489@dhcp-255-175.norway.atmel.com>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
	<1180374280.3642.114.camel@sauron> <20070528212513.5086bfac@newbox>
	<1180467763.3642.125.camel@sauron>
	<20070529222744.3e7a1489@dhcp-255-175.norway.atmel.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 30 May 2007 10:13:22 +0300
Message-Id: <1180509202.3642.131.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Ivan Kuten <ivan.kuten@promwad.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-29 at 22:27 +0200, Haavard Skinnemoen wrote:
> On Tue, 29 May 2007 22:42:43 +0300
> Artem Bityutskiy <dedekind@infradead.org> wrote:
>=20
> > Sorry for long delay. I is not quite what I asked, but anyway, may you
> > pleas apply the below patch, reproduce the problem and send me the
> > result.
> >=20
> > Please, do this faster if you can because I will need to disappear for
> > about 2 weeks in a day. I will try to figure out what is going wrong,
> > thanks.
>=20
> Here you go. I cut out a few bits that looked uninteresting as the
> whole log ended up at almost 150K. I can send you the whole log in
> private if you want it.
>=20

Haavard,

Thanks! Could you please try the below patch - it should help.


>From f84ae9eae2d0b12cff2e0f5a490a3d732458b381 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 30 May 2007 12:08:14 +0300
Subject: [PATCH] JFFS2: fix readinode()

If we have already read enough bytes, no need to call read_more().

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/jffs2/readinode.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 4884d5e..5663e8c 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1044,7 +1044,8 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info=
 *c, struct jffs2_inode_inf
=20
 		case JFFS2_NODETYPE_DIRENT:
=20
-			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent)) {
+			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent) &&
+			    len < sizeof(struct jffs2_raw_dirent)) {
 				err =3D read_more(c, ref, sizeof(struct jffs2_raw_dirent), &len, buf);
 				if (unlikely(err))
 					goto free_out;
@@ -1058,7 +1059,8 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info=
 *c, struct jffs2_inode_inf
=20
 		case JFFS2_NODETYPE_INODE:
=20
-			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode)) {
+			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode) &&
+			    len < sizeof(struct jffs2_raw_inode)) {
 				err =3D read_more(c, ref, sizeof(struct jffs2_raw_inode), &len, buf);
 				if (unlikely(err))
 					goto free_out;
@@ -1071,7 +1073,8 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info=
 *c, struct jffs2_inode_inf
 			break;
=20
 		default:
-			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_unknown_node)) {
+			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_unknown_node) &&
+			    len < sizeof(struct jffs2_unknown_node)) {
 				err =3D read_more(c, ref, sizeof(struct jffs2_unknown_node), &len, buf=
);
 				if (unlikely(err))
 					goto free_out;
--=20
1.5.0.6

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
