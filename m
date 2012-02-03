Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtEml-0000MS-BV
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 08:46:25 +0000
From: Stefan Roese <sr@denx.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 7/8] mtd: spear_smi: initialize writebufsize
Date: Fri, 3 Feb 2012 09:45:49 +0100
References: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
 <7720c371a73549c301023b95ab0f8eaad7ebc6a9.1328257053.git.artem.bityutskiy@linux.intel.com>
In-Reply-To: <7720c371a73549c301023b95ab0f8eaad7ebc6a9.1328257053.git.artem.bityutskiy@linux.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201202030945.49995.sr@denx.de>
Cc: Shiraz Hashim <shiraz.hashim@st.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 03 February 2012 09:43:13 Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> The writebufsize concept was introduce by commit
> "0e4ca7e mtd: add writebufsize field to mtd_info struct" and it represents
> the maximum amount of data the device writes to the media at a time. This
> is an important parameter for UBIFS which is used during recovery and
> which basically defines how big a corruption caused by a power cut can be.
> 
> Set writebufsize to the flash page size because it is the maximum amount of
> data it writes at a time.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: Stefan Roese <sr@denx.de>
> Cc: Shiraz Hashim <shiraz.hashim@st.com>
> Cc: spear--sw-devel@lists.codex.cro.st.com

Acked-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
