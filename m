Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q58Ek-00058K-Jt
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 03:07:55 +0000
Received: by iyb39 with SMTP id 39so2290088iyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Mar 2011 20:07:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
Date: Thu, 31 Mar 2011 11:07:52 +0800
Message-ID: <AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
Subject: Re: UBI memory usage on large page nand
From: Nicholas <ciliwung36@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I've a short of memory usage issue while using large page size of nand flas=
h.
Before, i was using 2KB page size of nand flash, i found UBI/UBIFS memory
consumption on normal zone are :

7 0xC0180858:=A0=A0 1024K, ubi_attach_mtd_de,
8 0xC0180834:=A0=A0 1024K, ubi_attach_mtd_de,
9 0xC00ED300:=A0=A0 1008K,=A0=A0=A0=A0=A0 ubifs_get_sb,
10 0xC00ED31C:=A0=A0 1008K,=A0=A0=A0=A0=A0 ubifs_get_sb,
11 0xC00FE7EC:=A0=A0 1008K,=A0=A0=A0 ubifs_lpt_init,
11 0xC00F95AC:=A0=A0 1008K, ubifs_mount_orpha,

Then, i'm using 8KB page size of nand flash, and found the result as below =
:
4 0xC0180858:=A0=A0 4096K, ubi_attach_mtd_de,
5 0xC0180834:=A0=A0 4096K, ubi_attach_mtd_de,
6 0xC00FE7EC:=A0=A0 4064K,=A0=A0=A0 ubifs_lpt_init,
7 0xC00ED31C:=A0=A0 4064K,=A0=A0=A0=A0=A0 ubifs_get_sb,
8 0xC00F95AC:=A0=A0 4064K, ubifs_mount_orpha,
9 0xC00ED300:=A0=A0 4064K,=A0=A0=A0=A0=A0 ubifs_get_sb,

My environment contains 2 mtd partitions for UBI.

Before, it took 6MB of memory consumption and now it takes 24MB.
Do you have any suggestion how to reduce the memory consumption since dram =
size
is pretty limited for other usage.

Thank you,
Alex
