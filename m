Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNOvT-0007mW-E7
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 12:35:31 +0000
Message-ID: <4DD67BE0.7070203@nokia.com>
Date: Fri, 20 May 2011 15:34:08 +0100
From: "Maxin B. John" <john.maxin@nokia.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
References: <4DD3B4C2.30301@nokia.com> <1305870365.2630.92.camel@localhost>	
	<4DD65673.8080801@nokia.com> <1305886801.2630.132.camel@localhost>	
	<4DD66B11.4070605@nokia.com> <1305893288.2630.141.camel@localhost>
In-Reply-To: <1305893288.2630.141.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 11-05-20 01:08 PM, ext Artem Bityutskiy wrote:
> On Fri, 2011-05-20 at 14:22 +0100, maxin wrote:

> Sorry for not noticing this immediately, but we never split the strings
> if it is not really necessary. What is the fundamental reason to put
> "\n" separately?
>

Thanks for a thorough review. I will modify it accordingly.

>Also, when I "git am" your patch, the Author's name will be "maxin", is
>this what you want?

Hmm.. I haven't noticed this before. Thanks... I have updated the MUA
settings.

Best Regards,
Maxin
