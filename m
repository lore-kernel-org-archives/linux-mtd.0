From: David Woodhouse <dwmw2@infradead.org>
To: Per Hedblom <per.hedblom@abem.se>
In-Reply-To: <20041220141528.2600B37E4A@smtp3-1-sn1.fre.skanova.net>
References: <20041220141528.2600B37E4A@smtp3-1-sn1.fre.skanova.net>
Content-Type: text/plain
Date: Mon, 20 Dec 2004 14:34:53 +0000
Message-Id: <1103553294.5917.49.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: question about placement of JFFS2_SB_FLAG_MOUNTING  flag.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-12-20 at 15:15 +0100, Per Hedblom wrote:
> My question is if it correct that this "Pass 2a" should be executed with the
> JFFS2_SB_FLAG_MOUNTING flag off. I can make the code run by moving the place
> were JFFS2_SB_FLAG_MOUNTING is turned off to after Pass 2a. 

No, you're just masking another problem. Where and why did it stop?

-- 
dwmw2
