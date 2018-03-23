Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezMBN-00040z-6r
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 12:52:34 +0000
Received: by mail-wr0-x22f.google.com with SMTP id l49so2881626wrl.4
 for <linux-mtd@lists.infradead.org>; Fri, 23 Mar 2018 05:52:22 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] RFC for Zynq QSPI
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 cyrille.pitchen@wedev4u.fr, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, Naga Sureshkumar Relli <nagasure@xilinx.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c06c5256-119d-ef90-0bf8-cdbc1720a7b9@gmail.com>
Date: Fri, 23 Mar 2018 13:52:18 +0100
MIME-Version: 1.0
In-Reply-To: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
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

On 03/23/2018 01:21 PM, Naga Sureshkumar Relli wrote:
> Xilinx Zynq uses a QSPI controller that is based on the Cadence SPI IP.

Don't we have a CQSPI driver already ? Why is this adding a new one ?

-- 
Best regards,
Marek Vasut
