Received: from mail-ia0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TilOr-0002wL-LU
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 12:26:58 +0000
Received: by mail-ia0-f177.google.com with SMTP id u21so796837ial.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2012 04:26:56 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 12 Dec 2012 09:26:56 -0300
Message-ID: <CALF0-+Xfy3q4+oOfXviGN2oBsV010zJ5XxKQ4FN99V0-KDGEiA@mail.gmail.com>
Subject: Testing ubiblock
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=f46d044630d20ab97d04d0a6eabb
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 richard -rw- weinberger <richard.weinberger@gmail.com>,
 Tim Bird <tim.bird@am.sony.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--f46d044630d20ab97d04d0a6eabb
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Here are the numbers on ubiblock, using the posted v2 patch.

The test is mainly focused on eraseblock wearing,
but some throughput information is also available.

If you want some background on ubiblock, read here:
http://lkml.indiana.edu/hypermail/linux/kernel/1211.2/02556.html

---

The test procedure is as follows:

First an image is created for each filesystem that will be tested
(currently ext4, vfat, ubifs).

This image has some files created by 'sysbench --prepare'.

Then an emulated environment is started and for each image
the following is done:

1. Insert nandsim driver (wear=0)
2. Format mtd device with ubiformat
3. Mount device (on ubiblock or not depending on fs)
4. Run sysbench test x 3, with one file-io mode. Report throughput.
5. Unmount device and remove ubi,ubifs,ubiblock drivers.
6. Report nand wear from nandsim.
7. Remove nandsim driver

Sysbench produces very artificial workloads, but it's very simple
and useful enough to get a feeling of ubiblock behavior under
specific conditions.

The results are: (complete reports attached)

Wear:		seqwr		rndwr		rndrw
--------------------------------------------------------------
ext4			5586		6932		5337
vfat			5554		8305		6005
ubifs-none	4965		4188		4141
ubifs-lzo		4104		4104		4104

Test time [s]:	seqwr		rndwr		rndrw
--------------------------------------------------------------
ext4			6.5		8.8		5.4
vfat			6.5		15.9		5.4
ubifs-none	5.0		0.5		0.3
ubifs-lzo		2.5		0.3		0.2

Transfer rate:	seqwr		rndwr		rndrw
--------------------------------------------------------------
ext4			7  M/s		450 K/s		700 K/s
vfat			7  M/s		250 K/s		500 K/s
ubifs-none	9  M/s		7   M/s		12  M/s
ubifs-lzo		18 M/s		10  M/s		16  M/s

---

Conclusions:

Despite being results obtained on a simulated nand, some conclusions
are possible.
First of all it's obvious that compression in ubifs greatly reduces
write I/O, thus reducing eraseblock wearing and improving throughput.
It's expected that implementing some kind of compression in ubiblock
would have a similar impact.

Sequential writes and random writes have a similar wearing in ubifs,
being log structured.
On the other side, block oriented filesystem, have a far worse
performance on random tests.
This is somewhat expected, given the design of ubiblock cache is
sequential-access oriented.
Given f2fs is also log-structured, we can hope to obtain some nice
numbers using it.

Interestingly, sequential writes produce a comparable wear
in ext2, vfat and ubifs-none.
Again, implementing some kind of compression in ubiblock might be
reduce eraseblock wearing numbers.

---

Thoughts?

Thanks,

    Ezequiel

--f46d044630d20ab97d04d0a6eabb
Content-Type: application/x-gzip; name="report_ubiblock.tar.gz"
Content-Disposition: attachment; filename="report_ubiblock.tar.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hamfnadw0

H4sIAGx0yFAAA+1dW2/bOBbus34F960FEoY8vKrAPszMdhfFoO2izWKxT4UvSmvUl46kXNpfv4dy
YitOE1uKyUgOiZkmsUmLOqQ+n/PxXPLs+yIvP/OTF/4aw2aUcj+5Uaz6mwmx/LlsLzgwjf8JpvB1
zqWAF0R5nNOqnRflICfkxc+sHDzU72IyzhYhJhS25Tfrf/1LPh/nl5/PhxP3/1lxPP25+Kzlu8nv
dDL70vIaboG1lDfrvfGTMy5hvf5Cv2DAQOP6s73e6T3tZv3zxaJ8qN+293vaPp3+9vH07ft/kdM3
n05fk2r5jwgn5dc8G4yLI6IlOZtMsyJZ7Yfk+Pg4OV2UgymZn8+GWV6QxRnJ8kGRFa8JkZxB8r56
Y/U6GU4Xo2/uXSJZqpPfLvDlL9n1+PpwnrwbXE1m57NfvAfJu8n8nvd4/ZLDglxOyq/X1x4tzudl
Qc7yxYwwUi7wn9eE7dafu/4c++O0dxwCbgjgEJ0UP4phNh99JYxKygFvf3Y+LSfHS+FmY4IdymxG
sovB9HxQThZzUvWfDfJvSfLxfD6fzL/gUmSkzIpyecGzxXS6uHSvL767EcXr2rSuV82JI3lzVeaD
au2wZzYnZ9PBl8Ld+M2KHhHL2J9Dkg1GXxPF3g1x4m5RqyHF5GeW/O5WrfqVyD+Htevkg/kYbzXP
/jrHieGNL/Kb195+wKvjY518xJmc/DeflBm+hTOtOo0Ws+Fkjne+6l3dGg6hiiX/zvLJYjwZkX9+
+t/7P0g2Hwyn2fiIjAbTqbvjs+LHfPTyVTVjd5HVBGjyx0aXQVnJLZuPK7lgpyPyZvl5NPlP4bq6
nl/zxXxxXpC3Jx/IbDHOkn8s3Fs393dyWQ1NTpdyJQ4rymz8N+w2z2iSfPieVfc2Lwj+hjc4y8a4
yhqn5m7/CLcNI5UM3IPEyAecU07+Trj7o3qEKjERoEIKiytQdS5xtVAeGpR7Zfmk4VrOi7Msz1F2
gqYIlu69l1xTw8W74UmRjV4lRIKxVKV48aVc3Msku8pG5zjrJDl1u2j5p9trxfkMd9qP1wk+ltdr
X05mmXtK72mMghCmqA2oPYkXGT4DG4OrnXD740k5+IY3OPyxHLGeD+5NyjSzVX8U5/H16jqpl5Oi
nIyK5VSrNpvMH5joesJMzIr1qMHFl91G6fqo2eBqh1GcSnXrWt+/54srSkiq3O2M8Gbxydr8ILyW
xVGrLXY2mOTzrLi+1aVQyUuc90lRjsfZxav6BzjxUvcleuJ+LEeslrcS9ubIpYiX3SM+RXzyjE/g
Hgq7wiclU0G58IhP3ALziU8SRCfwSTbHJ0Y1b4VPKiw+oYgjPkV8CoVPWuk1PikpqFVe8YlJr/jE
eX/xSdle4BPn1/j0oBEsD9EItrahEWyTp2Y4YnuobfJ/RfbXZV7xf9lVKR9N/VXtYf6PGcXFbf6P
G1A88n8h2gb/Vy3/r/k/tx+2UX8stYeIeqlsiHpwaKprZzTLwn0uKgI42ctKN345wvt20njVStW8
UTQ52LqqudY0weJfNVWT1ZTMSnK/UDCXr7801CgFK+WSp1ahnupNudRUSiOaKJfunnfXLt3kGexZ
u0zbaJcSGmqXoEBR28r65bq9dunk20y9XMr4MM3fiCGtMMQqs4IQYJxT4Y/f11ToZvx+UwgBa7sB
IbwphGjt1qIPEOJkHCEkQsgKQjQHUVNDpKXGpxqitPWrhmjoBoY0VkO01m0x5BEkVys1BGW8leVS
yurDs/dAM93Q3uMyZf0kun7h/xWY/+GMA7/D/4jI/wRpd/2/Iv8T+Z94dLnU6h6lyrHdzi7rmtz6
ZPLBU0spFRowf95odIQ7q9DfqaWlqWXK56klqqR7VuhUq1PLtI3Xl2jHKwU+tUQRH6ZNGKGpU9Ck
BFW3oElQYT1CkwXm1eHLdASaTBuHCstaQRMPC00mQlOEphDQBPhdfRuamFdoksKr1qRh375eMpSv
PKNpP3zlYbuvl07FAQY8cdBNA57ACt1PFuz5tvvjPwPyf8Lc4f8ki/xfiLZ7/Gfk/yL/93w02e6H
LhiBW0vV1FkLVHNv6qyi0mjuTZ3l1DDQT6/Ounk0VmcBNk+Qd1JnxdKqD6XOLkUcLe2IT2FC03F3
m3XoJwGjaOov9FNQDdIfPjneTslOhFa1MrdVu9DPwOY2ijjiU8SnUPik0zo8IYL4O0N1Hy4becU1
h6duRH62gyfRCp7S0PC0nQ1UQpjDs4HBKtXUJw6/jiMb2PV2P/93cTYoA/F/km3yf4LpyP+FaLvz
f24/RP4v8n9Rf+2G/qqUQbWpxv+J1KenjaHcSH/H2ZxqbvYd1dFCgcV5NI3qIC7mpY2njaQAQfk/
J+JoX0d8CnQ+Yag09fMJSYXxeT4BIvWaWkmxp8entqmVTDv+7xGRq61SKykW8SniUxh8AtxYso5P
HJ9Ij/ikQNiY+u2eUaaVp3IXU7/hDlaHZwQDt6YpAZiyNBKAHW/b6j/MEa0fywJu5//kZv0HyU3k
/0K0pvUf3H6IBSBiAYioxXZDi+VAQa8TRAkucasxjwmMBdrxXoNa9h5vF+wYG9Ce6IOXjY7xdhGf
QuGTQnxaJ1gXKbP4lPgsUKOUXxaQ79tLOSZYv2NlRy/liE/B8EkoVcMnwaj1d4rq8El61Z9Eum8W
EMLhk4A+4BOKeIcCEJIfohGsdrzEygiWKnKAHW735/8L5/8H7E78r+Cx/muQtnv+v+j/F/3/no/m
2ulMNqA4lbWja6KBWu1NaUUdGc12n8ErXMp9x9a1SmXDW2itCh/vNlqrDBu84kQcreqITf6xSVHD
69gkfIb9IjZpCX5LKtoO5CXYzBu4a3JSaJGX4AkYPxsZv4hNAbAJ/0hvY5Pyd1iK2GRwZ3vFpjTt
LzapXrB9KOKtbJ8Vj/H5gwcMX/GUKQC5blruFR/SHd0EhRsiqjhhG+OEn6zdX/81FP/n6r/KO/wf
xPjfIG33+q+R/3vG/F9n1MyeFV4Tqa4VXnOmsT9TWFMlZSPfl2aF14CCUXtWN3mrw2Vum6qbwmgq
TRt18zEhus0Lry1lfJi2cMSQdvVfZWprBWBZSpW/NFWuAGzayGJtiiFS2j1T/Zy3wpDGtX4AgJpW
dFpoDHEyjhgSMWRdhx6kqekhxmUO8VmH3oDHItL4HZmabmBIcz1EmGXlr/W1di3K84jjwlZ6CMp4
hwKwSh6ewQdaNOa9pLK9JLHu53+W8X7Tn4tHk0Db+R+9Gf8pWPT/CtJ2539W+yGGfz7T8M+ofLVQ
voBRLdcBBgqsouAvAAqVf+CN0ow0U74YNZaJPZ85tquI2DxCk6MB1y4C6hF1GporX0sZRwMuYsg1
hnBLQa9JIKmN9pmrHJ8SYRoVVW2KIVam+86lFqqqKmKIbZesPDCGOBlHDIkYcoMhKRVqXe9AusMo
68/3Caiy4FUPsVzs2y8zoB6idS8wBGW8Q6gjO0ASSDLblATqIwN0f/xfKP6HMw5ik/8BzSP/E6Lt
Hv8X+Z/nzv9EZ/YuObNz/HoWcu0ZYIxAnctn5i/N/JazF/v2ZQ+lz+Hute14pdCZv8SB+hZFaOoU
NKF9A2KdVAcER/TwCU0s9QpNSvY2BJBR08rvMXTqfxRxhKYITd6hSVCW1vKlCgXU+qtKwiikXjMn
MAX7Po0LCE0tqxKHhiYQkQQ7ZBLsGbdt/F+Q/P+g7ub/j/F/QVpT/i/m/48EYFRlO6HKGio4W5/o
cmu4XwJQCb8V7DX09UC3PQEYuII9ijha2RGa/EOTNFzWIo4cI+jTylbQzNmkOQHY2zw7DJelF1a2
jGcTEZoCQJOWJq0nZTA+c6c6jot5hqZOpE5tCU09OZvYHgopuT3I3Desae6bFCID2J+2Lf7TP//H
jAJ+h/8T0f8vSGsa/xn5v2fM/3VG0exT4EVKbapqfnpKCArgsc48U34DL4wW+y4xFYyn020LzYcO
AEUZH6Y1HDGkFYZIbtZeK4BfsT6T6ivnUAc+MSQF6AaGNA8ABUFlL4K3nIwjhkQMWWGIY6JqGCIk
fs14xBBQxiuG2P0X5giFIS5HWrvk98GDyO0OAaCpfkT2+64afAJgx1T2a983nUbuK7bYYosttj60
/wNGE1i4APAAAA==
--f46d044630d20ab97d04d0a6eabb--
