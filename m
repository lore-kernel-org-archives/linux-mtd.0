Received: from calf.ext.ti.com ([198.47.26.144])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhHyw-0007mI-2o
	for linux-mtd@lists.infradead.org; Mon, 06 Nov 2006 22:50:45 -0500
Received: from dbdp30.itg.ti.com ([172.24.170.39])
	by calf.ext.ti.com (8.13.7/8.13.7) with ESMTP id kA73oD2B012142
	for <linux-mtd@lists.infradead.org>; Mon, 6 Nov 2006 21:50:25 -0600
Received: from x0019732 (localhost [127.0.0.1])
	by dbdp30.itg.ti.com (8.12.11/8.12.11) with SMTP id kA73oB2U024461
	for <linux-mtd@lists.infradead.org>;
	Tue, 7 Nov 2006 09:20:13 +0530 (IST)
Message-ID: <000e01c7021f$d436ee80$5ef5180a@ent.ti.com>
From: "Anand Patil" <anandpatil@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: region_info_user and otp_info 
Date: Tue, 7 Nov 2006 09:20:10 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
       I am new bee to MTD user land,

      1)  Iam not getting what region information refers to in MTD?
            ---------------------------
            struct region_info_user {
            uint32_t offset;                /* At which this region starts,
                                         * from the beginning of the MTD */
            uint32_t erasesize;             /* For this region */
            uint32_t numblocks;             /* Number of blocks in this 
region */
            uint32_t regionindex;
            };
           ---------------------------

    2) I did'nt get the purpose of the below strucuture defined and its 
usage ?
        ---------------------------
        struct otp_info {
                uint32_t start;
                uint32_t length;
                uint32_t locked;
        };

        ---------------------------

Warm Regards,
Anand Patil 
