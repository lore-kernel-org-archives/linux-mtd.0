Received: from [202.106.187.156] (helo=sina.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UKjv-0003OK-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2003 05:51:28 +0000
Date: Fri, 3 Jan 2003 14:22:17 +0800
From: "thierry" <jokyman@sina.com>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Subject: jedec_probe still not working
Mime-Version: 1.0
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Message-Id: <E18UKjv-0003OK-00@pentafluge.infradead.org>
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

I have try to use the cfi_probe.But I met the same problem.
So I go back to use jedec_probe.
My board is based on DragonBall ez328,uClinux20020927
I call the jedec_probe to detect my flash.
I set:
=09cfi->addr_unlock1 =3D 0xaaa;
=09cfi->addr_unlock2 =3D 0x554;
It execute:
=09/* Reset */
=09cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type,=
 NULL);

=09/* Autoselect Mode */
=09cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,=
 CFI_DEVICETYPE_X16, NULL);
=09cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,=
 CFI_DEVICETYPE_X16, NULL);
=09cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,=
 CFI_DEVICETYPE_X16, NULL);

=09if (!cfi->numchips) {
=09=09/* This is the first time we're called. Set up the CFI 
=09=09   stuff accordingly and return */
=09=09
=09=09cfi->mfr =3D jedec_read_mfr(map, base, osf);
=09=09cfi->id =3D jedec_read_id(map, base, osf);

=09=09printk("mfr:%lx\n",cfi->mfr);
=09=09printk("id:%lx\n",cfi->id);
When kernel boot up,it print=A3=BA
mfr:7f
id:fffc
My flash is hy29lv190
manufacturer code is 0xAD
device code is 0x22C4
I can't find out the problem.
Can anyone point it out?
Thanks!
