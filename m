Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RApGK-0006cu-1F
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2011 20:37:21 +0000
Message-ID: <4E8A1CD7.8080908@freescale.com>
Date: Mon, 3 Oct 2011 15:36:39 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Lars Michael <lh_post@yahoo.com>
Subject: Re: [U-Boot] U-Boot: using nand write to flash an ubi image, ubi
	part fails
References: <1317354248.25348.YahooMailClassic@web160616.mail.bf1.yahoo.com>
In-Reply-To: <1317354248.25348.YahooMailClassic@web160616.mail.bf1.yahoo.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/29/2011 10:44 PM, Lars Michael wrote:
> --- On Thu, 29/9/11, Matthew L. Creech <mlcreech@gmail.com> wrote:
>> 2. Use the "ubinize" tool to create an image suitable for
>> writing
>> directly to NAND.  This takes a UBIFS image and
>> "wraps" it to turn it
>> into a UBI image, which you can then use with "nand
>> write".
> 
> This is what I am doing (or plan to do). But to get it to work, I need
> the space fixup feature for the nand write in U-Boot. I got that feature in Linux, so in Linux it works. Unfortunately it is not easy to patch 
> that one in my 2009.08 U-Boot.

Try using a current U-Boot, and use "nand write.trimffs".

-Scott
