Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <E902C77C74C544A3A554DD9881742C04@sisodomain.com>
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
	<1251466736.3514.10.camel@localhost>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
	<9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
	<C48D93C7DF3C4F9C96E47BE9D6F51F37@sisodomain.com>
	<4A9E0C47.205@gmail.com>
	<8A3568961C4E4E7495A397D2267B6E37@sisodomain.com>
	<1251958245.5060.6.camel@localhost>
	<FC4F021760EA4F649917598723041422@sisodomain.com>
	<1251976743.5060.13.camel@localhost>
	<E902C77C74C544A3A554DD9881742C04@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Sep 2009 12:38:48 +0300
Message-Id: <1254130728.3778.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-09-07 at 15:15 +0530, Amul Kumar Saha wrote:
> What is OTP in OneNAND?
> The device includes,
> 1. one block-sized OTP (One Time Programmable) area and
> 2. user-controlled 1st block OTP(Block 0)
> that can be used to increase system security or to provide identification capabilities.
> 

Could you please refresh your patch and resend it? The old one does not
apply anymore.

Also, could you please avoid doing these:

printk(KERN_ERR "onenand_write_ops_nolock: \
       write failed %d\n", ret);

function name prints. This is bad practice. You could amend whole
onenand_base.c first, then send the OTP re-write as a follow up patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
