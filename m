Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUHCq-00074R-0x
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 15:31:44 +0000
Received: by mail-we0-f178.google.com with SMTP id q58so1635611wes.37
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 08:31:21 -0700 (PDT)
Message-ID: <1410967880.5542.8.camel@lp-lvrv.comap.cz>
Subject: Re: Destructive nandtest?
From: Rostislav Lisovy <lisovy@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 17 Sep 2014 17:31:20 +0200
In-Reply-To: <20140916192610.GB1193@ld-irv-0074>
References: <1410884555.23903.13.camel@lp-lvrv.comap.cz>
 <20140916192610.GB1193@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Michal Vokac <michal.vokac@comap.cz>,
 linux-mtd@lists.infradead.org,
 Ezequiel =?ISO-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian;
Thanks for your reply.

On Út, 2014-09-16 at 12:26 -0700, Brian Norris wrote:
> All of your analysis looks accurate to me. Personally, I never used
> 'nandtest' much myself, because of glaring ommissions like you've
> noticed. I wouldn't mind just dropping the '--keep' option, since it's
> a lot of work to try to do correctly, and in its current state, it is
> completely broken and misleading.

I have some proof-of-concept code that does store the OOB (and restores
it later) and is able to distinguish if the page is erased or not (in a
bit naive manner -- if the page is all 0xff and particular ECCs as well)
and decide is the data should be restored or not.
I hope I will be able to post the code soon.

Best regards;
Rostislav
