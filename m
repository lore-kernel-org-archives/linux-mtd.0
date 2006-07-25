Received: from mtagate5.uk.ibm.com ([195.212.29.138])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G5REw-0003ss-HK
	for linux-mtd@lists.infradead.org; Tue, 25 Jul 2006 19:02:43 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.13.7/8.13.7) with ESMTP id k6PI2P8k067060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2006 18:02:25 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k6PI44oj116852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2006 19:04:05 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id k6PI2P9O011438
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2006 19:02:25 +0100
Sender: ARNEZ@BL3C0375.boeblingen.de.ibm.com
To: "Josh Boyer" <jwboyer@gmail.com>
Subject: Re: can I use vfat filesystem on UBI layer?
References: <49eab5c80607230204k53cde2adm9ef7290ce90e465f@mail.gmail.com>
	<625fc13d0607231133p28854ce7t74c96e3484415284@mail.gmail.com>
From: Andreas Arnez <arnez@vnet.ibm.com>
Date: 25 Jul 2006 20:02:28 +0200
In-Reply-To: <625fc13d0607231133p28854ce7t74c96e3484415284@mail.gmail.com>
Message-ID: <m3psftlg0b.fsf@BL3C0375.boeblingen.de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: falls huang <falls.huang@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Josh Boyer" <jwboyer@gmail.com> writes:
> I believe that is one of the intended goals.  A block layer needs to
> be added (much like mtdblock), and then one should be able to use
> vfat, ext2, ext3, reiserfs, etc.

A block layer like mtdblock should be offered.  This is one reason for
gluebi -- which presents a UBI volume as an mtd device.  Note,
however, that something like mtdblock is not very practical for
read/write file systems like vfat, because of its large (internal)
block size.

--
Andreas Arnez
