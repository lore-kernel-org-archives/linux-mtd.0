Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EgMSd-0008JA-RQ
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2005 08:20:58 -0500
Message-ID: <4389B293.3020507@yandex.ru>
Date: Sun, 27 Nov 2005 16:20:19 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>	<4386FC5F.9050305@yandex.ru>
	<4389AE3D.8000807@inf.u-szeged.hu>
In-Reply-To: <4389AE3D.8000807@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, "Zhao, Forrest" <forrest.zhao@intel.com>
Subject: Re: The problem that I didn't think out
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc, Greetings!

> We had some time, so we read the plan of JFFS3 (with RaiserFS
> documentation).
Oh, what a delightful news! :-)

> The key compression is the only one in the plan that I think that is
> better if we don't use. I think to make key management as simple and
> fast as possible is more important than some percent in flash usage. (if
> I am right the bottleneck of real products is not the flash usage but
> the speed) But it is small techniqual question.
Well, I would not agree, compression Guru Ferenc though you be :-) When 
you start thinking about GC, you'll notice that Indexing nodes are to be 
rewritten *a great deal* of times. So, the smaller is the index, the 
faster is JFFS3. The main idea of key compression is *not* to save flash 
space, but to lessen the (index size)/(data size) ratio.

Nonetheless, tests should show the worthiness of keys compression. There 
is obviously a (CPU time) vs. (amount of flash IO) trade-off. Thus, I 
offer to wait for a JFFS3 prototype and evaluate this. Let's mark this 
stuff as "to be evaluated".

> The big questions are that questions you already thinging on: garbage
> collection and wear leveling. Without solving them JFFS3 have no nice
> future. I only would like to say that now we are also thinking on these
> important problems... and we will write if anything usable found. (I may
> be better feeling to thinking on someting not alone... :) )
Great! :-)

Thank you for this feedback.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
