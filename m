Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxP2j-0006aT-Qo
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 09:00:33 -0400
Message-ID: <42E633C4.2060208@yandex.ru>
Date: Tue, 26 Jul 2005 16:59:48 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <42E62254.9040806@inf.u-szeged.hu>
In-Reply-To: <42E62254.9040806@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: compressors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> Dear All,
> 
> Artem's warned me about the compressors lzari and lzo, and he's right.
> 
> We adopted them for JFFS2 some years ago, but now they are unused
> because have no good performance, have messy code and licence problems.
> I think it's time to delete it from CVS. If nobody cares I remove it. I
> think we should consider to remove compressor rubin, also.
> 
Ok for me. David said it is OK for him as well.
I think you may remove that...

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
