Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Awcby-0007ez-Qu
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2004 07:40:43 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 27 Feb 2004 20:48:26 +1300
References: <01139FC052A0D411900B00508B9535FC102796BC@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC102796BC@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040227074004.750D742A7@blood.actrix.co.nz>
Subject: Re: Searching for 16bit NAND Driver
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 27 February 2004 14:49, Shen Aaron-r62966 wrote:
> Hi,
>
>   Is there NAND driver supporting 16M X 16 bit NAND Flash, such as
> K9F5616Q0C of sumsung?
>
>   Best Regrads!
>
> Aaron
>
If there isn't it is not a big deal to hack one out of an 8-bitter.

The 16-bit devices only use 16-bit transfers for the data. All the copmmands 
etc are still done in 8-bit wide accesses.

-- CHarles
