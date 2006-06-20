Received: from fra-del-04.spheriq.net ([195.46.51.100])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsbYY-0004uY-Nq
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 04:26:14 -0400
Received: from fra-out-01.spheriq.net (fra-out-01.spheriq.net [195.46.51.129])
	by fra-del-04.spheriq.net with ESMTP id k5K8PlnH004570
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2006 08:25:48 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-01.spheriq.net with ESMTP id k5K8PfOB020857
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2006 08:25:41 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-01.spheriq.net with ESMTP id k5K8Pd60029563
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2006 08:25:40 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E4AEDA43
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jun 2006 08:25:39 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 313C047344
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jun 2006 08:25:39 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 mounting performance improvement
Date: Tue, 20 Jun 2006 10:25:31 +0200
Message-ID: <000601c69443$1c7de450$253682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


It seems that during the JFFS2 mounting, the file system uses the =
function cfi_intelext_point (in jffs2_scan_medium function) to point to =
the flash memory. This function refers to the flash memory using the =
virtual address (map->virt). But if the flash is cached and the burst =
mode is enabled, it should be better to refer to the flash with the =
address map->cached (in the same way of cfi_intelext_read function, that =
calls the map_copy_from function, in which there is a check to verify if =
the flash is cached). This improves in a considerable way the =
performance during the mounting phase, reducing the mounting time.=20
What do you think about? Do you agree with me? Do you know if there are =
other points in JFFS2 code that uses the virtual address map->virt =
instead of map->cached.

Best Regards,
Davide
