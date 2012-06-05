Received: from nm12-vm0.bullet.mail.ne1.yahoo.com ([98.138.91.51])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sbthe-0004ZM-Nx
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 13:21:43 +0000
Message-ID: <1338902500.33577.YahooMailNeo@web39302.mail.mud.yahoo.com>
Date: Tue, 5 Jun 2012 06:21:40 -0700 (PDT)
From: Doug Kehn <rdkehn@yahoo.com>
Subject: UBI: Single versus Multiple Images
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Doug Kehn <rdkehn@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Everyone,=0A=0AI have the following NAND flash MTD layout (presently JFF=
S2):=0A=0A* Boot-loader=0A* Kernel=0A* Root file-system (rootfs)=0A=0A* Dat=
a=0A=0AI'm going to switch from JFFS2 to UBI/UBIFS.=A0 I'm wondering if it =
is better to create a single UBI image containing both rootfs and data volu=
mes or to create separate UBI images (each with a single volume) or is the =
answer it depends?=0A=0AThe data volume will be used for logging data.=A0 T=
he volume won't completely fill as old data will be purged to make room for=
 new data.=A0 For the single image multiple volume case, if I understand th=
e =0Adocumentation correctly, UBI will use all PEB from both volumes for ma=
pping per-volume LEB, =0Acorrect?=A0 If my understanding is correct, then i=
t's possible, after enough time, maximum PEB erase count will be reached an=
d both rootfs and data volumes will be read-only?=A0 If the goal is to keep=
 the rootfs volume writable, even if the data volume become read-only, then=
 would it be better to create multiple UBI images?=A0 Or is my understandin=
g all wrong?=0A=0AThanks,=0A...doug
