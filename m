Received: from nz-out-0102.google.com ([64.233.162.193])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FY2F7-0003bp-Oz
	for linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 10:40:56 -0400
Received: by nz-out-0102.google.com with SMTP id 16so864801nzp
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Apr 2006 07:40:34 -0700 (PDT)
Message-ID: <cda58cb80604240740j62e51ecctb3ad75673b98445a@mail.gmail.com>
Date: Mon, 24 Apr 2006 16:40:34 +0200
From: "Franck Bui-Huu" <vagabon.xyz@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: Franck <vagabon.xyz@gmail.com>, Nicolas Pitre <nico@cam.org>
Subject: Reduce the size of a probed flash for broken HW
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[discussed with Vitaly Wool on IRC]

My hardware has some problem to access my onboard flashes specially
the last 64Ko of them. So I need a way to restrict access to these areas.

Several solutions comes in mind:

  - In the mapping driver, try to modify the mtd_info and cfi_info
    setup by the MTD probing functions to reduce the detected
    size. This solution is really hackish since it modifies internal
    structures of the MTD layer that the mapping driver is not
    supposed to be aware of. I just did this in my driver:

=09*mtd =3D do_map_probe("xxx_probe", map);
=09while ((*mtd)->size > 32Mo - 64Ko)
=09=09(*mtd)->size -=3D (*mtd)->erasesize;

    and it seems to work fine...

  - Use a partition that exclude the last 64Ko of the flash. This
    solution was suggested by Nicolas Pitre, but I think it imposes
    some restrictions on flash concatenation for example.

  - Modify the common MTD layer to take into account the value of the
    mapping size given by the hardware: if the driver setup a mapping
    size of the flash lesser than the real flash size then the MTD
    layer should use the map size instead of simply ignoring it. Thus
    the MTD layer gives the opportunity to the driver to reduce the
    size of the flash.

Can anybody gives some feedback or others solutions ?

Thanks
--
               Franck

[Please CC me, I'm not subscribed to this list]
