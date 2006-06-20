Received: from gw-nam4.philips.com ([161.88.253.58])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsbid-0005Bi-PA
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 04:36:32 -0400
Message-ID: <08c601c69444$968a2280$de1e55a1@code1.emi.philips.com>
From: "Balaji" <balajika@blr.pin.philips.com>
To: "Davide CASCONE" <davide.cascone@st.com>, <linux-mtd@lists.infradead.org>
References: <000601c69443$1c7de450$253682a4@nap.st.com>
Subject: Re: JFFS2 mounting performance improvement
Date: Tue, 20 Jun 2006 14:06:13 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Reply-To: Balaji <balajika@blr.pin.philips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Best Regards
====================================
 Balaji Kadloor
 Philips Semiconductors Division (HIC-B)
 Philips Innovation Campus
1 Murphy Rd, Ulsoor, Bangalore - 560008, INDIA
Tel: (91)-80-25579000 X2269,
Fax: (91)-80-25560580
====================================

"  Success doesn't go to the Faster or the Stonger Man.
   Sooner or Later,the man who wins is the man who thinks HE CAN "
----- Original Message ----- 
From: "Davide CASCONE" <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Sent: Tuesday, June 20, 2006 1:55 PM
Subject: JFFS2 mounting performance improvement


>
> It seems that during the JFFS2 mounting, the file system uses the function
cfi_intelext_point (in jffs2_scan_medium function) to point to the flash
memory. This function refers to the flash memory using the virtual address
(map->virt). But if the flash is cached and the burst mode is enabled, it
should be better to refer to the flash with the address map->cached (in the
same way of cfi_intelext_read function, that calls the map_copy_from
function, in which there is a check to verify if the flash is cached). This
improves in a considerable way the performance during the mounting phase,
reducing the mounting time.
> What do you think about? Do you agree with me? Do you know if there are
other points in JFFS2 code that uses the virtual address map->virt instead
of map->cached.
>
> Best Regards,
> Davide
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
