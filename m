Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5gUJ-0004ds-Dg
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2018 23:46:16 +0000
Received: by mail-wr0-x22d.google.com with SMTP id n2so11169434wrj.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 Apr 2018 16:46:04 -0700 (PDT)
Subject: Re: [PATCH v9 1/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
To: Han Xu <han.xu@nxp.com>, Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Suresh Gupta <suresh.gupta@nxp.com>
References: <1522733475-31480-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1522733475-31480-2-git-send-email-yogeshnarayan.gaur@nxp.com>
 <34b0976f-eedc-f6d9-7dcc-423eecac515e@nxp.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <09b68a38-b3b6-61be-84a1-38565b3e35f7@gmail.com>
Date: Mon, 9 Apr 2018 23:49:54 +0200
MIME-Version: 1.0
In-Reply-To: <34b0976f-eedc-f6d9-7dcc-423eecac515e@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/09/2018 11:34 PM, Han Xu wrote:
[...]
>> +/* Prepare LUT for AHB read - required for read from devmem interface */
>> +static void fsl_qspi_prep_ahb_read(struct fsl_qspi *q)
>> +{
>> +	struct fsl_qspi_mem_op;
> Did the code pass compile?

Can you please remove irrelevant parts of the patch when commenting on
it (use [...] to indicate the part of removed). It is real hard to find
your comments in the patch, esp. if you don't even put newlines around them.
[...]

-- 
Best regards,
Marek Vasut
