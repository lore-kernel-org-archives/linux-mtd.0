Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyPCh-00012X-8C
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 19:12:40 +0000
Received: by wmww144 with SMTP id w144so124209199wmw.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 11:12:17 -0800 (PST)
Subject: Re: [PATCH] mtd: nand: mxc_nand: fix a possible NULL dereference
To: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112081909.GD24008@pengutronix.de> <20151116183333.GL8456@google.com>
Cc: baruch@tkos.co.il, dwmw2@infradead.org, fransklaver@gmail.com,
 k.kozlowski.k@gmail.com, luis@debethencourt.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: Corentin LABBE <clabbe.montjoie@gmail.com>
Message-ID: <564A2A8E.30506@gmail.com>
Date: Mon, 16 Nov 2015 20:12:14 +0100
MIME-Version: 1.0
In-Reply-To: <20151116183333.GL8456@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 16/11/2015 19:33, Brian Norris a écrit :
> On Thu, Nov 12, 2015 at 09:19:09AM +0100, Uwe Kleine-König wrote:
>> I really wonder there is no helper
>> function like:
>>
>> 	#define of_sensible_name(dev)	of_match_device(dev->driver->of_match_table, dev)
> 
> How about of_device_get_match_data()?
> 
> It's not exactly what you asked for, but it gets what you need here.
> 
> Brian
> 

I have got the same comment from another thread.
I will use it. Thanks

Regards
