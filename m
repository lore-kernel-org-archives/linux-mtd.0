Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S602l-0003Or-TC
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:39:40 +0000
Message-ID: <1331300518.29445.32.camel@sauron.fi.intel.com>
Subject: Re: [Resent with proper line wrap] Request for comments: UBI PEBs
 as a multiple of erase size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Paul Herbert <kevin.herbert@meraki.net>
Date: Fri, 09 Mar 2012 15:41:58 +0200
In-Reply-To: <6C6BF63D-5411-490C-BC7D-19227423B6BF@meraki.net>
References: <40BCDFDF-F9C8-46C5-99F8-E56050E8B32C@meraki.net>
 <6C6BF63D-5411-490C-BC7D-19227423B6BF@meraki.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-09-13 at 22:21 -0700, Kevin Paul Herbert wrote:
> [Sorry for the ugly lack of line-wrap... I thought I knew better. :-)]
> 
> I came across a situation where I wanted to be able to use the same pre-built
> (with UBI) image on two different FLASH devices, one of which having a
> larger erase size than the other. I actually did not notice that the device
> I was using had a different erase size, which caused UBI to quietly corrupt
> my FLASH.

Feel free to send a patch, sure.

-- 
Best Regards,
Artem Bityutskiy
