Message-ID: <4A9B79E0.1010300@gmail.com>
Date: Mon, 31 Aug 2009 10:21:04 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] mtd: onenand: use KERN_DEBUG for ECC errors
References: <1251702212-17785-1-git-send-email-dedekind@infradead.org>
	<9c9fda240908310015s24807b3fo6c9522b2050bdb86@mail.gmail.com>
In-Reply-To: <9c9fda240908310015s24807b3fo6c9522b2050bdb86@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind@infradead.org>, linux-mtd@lists.infradead.org,
	Adrian Hunter <Adrian.Hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/31/2009 10:15 AM, Kyungmin Park wrote:
> Hi<
>
> As I remember, it's changed from KERN_DEBUG to KERN_INFO from adrian request.
> I think you worry the ecc error message. If so, how about to change
> the ecc message itself? e.g. ecc info
> Also controller info instead of controller error.

Yeah, may be. It is just that we keep getting questions like
"is this harmful?". Probably it is indeed better to tweak the
message itself and make it look less worrying.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
