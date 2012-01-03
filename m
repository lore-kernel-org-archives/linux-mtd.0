Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=TX2EHSOBE002.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ri87B-0003Of-UJ
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2012 17:25:34 +0000
Message-ID: <4F033A09.10202@freescale.com>
Date: Tue, 3 Jan 2012 11:25:29 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Vipin Kumar <vipin.kumar@st.com>
Subject: Re: [U-Boot] 4k page ONFI NAND
References: <4F02CC0C.8020203@st.com>
In-Reply-To: <4F02CC0C.8020203@st.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/03/2012 03:36 AM, Vipin Kumar wrote:
> Hello,
> 
> We have a Micron 4K page sized ONFI NAND MT29F16G08
> I am encountering frequent errors while reading the device. Although the
> data area is protected for 8bit correction with BCH8 algorithm, the oob
> area is unprotected and is susceptible to bit flips
> 
> These errors are very frequent and it results in jffs2 file system
> mounting problems and other related issues
> 
> I also confirmed the problem through oobtest module.
> 
> Can you please suggest any solutions/workaround

Use ubi -- the OOB will then only be used for ECC.

-Scott
