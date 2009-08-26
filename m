Message-ID: <4A94CF0A.6060106@gmail.com>
Date: Wed, 26 Aug 2009 08:58:34 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
In-Reply-To: <87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: dedekind@infradead.org, David Woodhouse <dwmw2@infradead.org>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/26/2009 08:41 AM, Amul Kumar Saha wrote:
> Resending the patch, as there was a line-wrap issue in the earlier post.
>
> With Regards,
> Amul Kumar Saha
>
>
> Re-implemented OTP support for OneNAND
> Added following features to OneNAND
> 	1. Lock only 1st Block in OneNAND
> 	2. Lock BOTH 1st Block and OTP Block in OneNAND

-ENOPARSE

Large patches like this normally require good explanations of what is
done, why it is done, which problem it solves, how it is done, etc.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
