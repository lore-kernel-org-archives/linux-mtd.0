Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKFF2-0004TF-0D
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 08:06:57 -0400
Message-ID: <417654BF.4010703@yandex.ru>
Date: Wed, 20 Oct 2004 16:06:23 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>	
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>	
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>
	<1098180892.13633.1079.camel@hades.cambridge.redhat.com>
	<41762CF9.9030501@inf.u-szeged.hu> <41764851.4030207@yandex.ru>
	<417651AD.50001@inf.u-szeged.hu>
In-Reply-To: <417651AD.50001@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If the "one step" means that you would like to use only one 
> jffs2_decompress/... call than the answer is no.
Ok, thanks for answer, I suspected so. But I was confused by the 
interface function jffs2_free_comprbuf, and slender hope have appeared. :-)

> 
> But I can imagine a solution, where you can call jffs2_compress 
> separatedly for the small buffers, and you can uncompress it using a loop.
> 
> The compression buffer can be something like the following:
>   - original_size_of_small_buffer1
>   - compressed_size_of_small_buffer1
>   - comprtype (return value of jffs2_compress)
>   - compressed data1
>   - original_size_of_small_buffer2
>   - compressed_size_of_small_buffer2
>   - comprtype (return value of jffs2_compress)
>   - compressed data2
>   ...
> 
> I don't know it is OK for you or not.
It would be OK, if I don't have to store the sizes of original buffers 
(original_size_of_small_buffer1, etc) in the node... This is because the 
number of input small buffers isn't fixed...

Thank you.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
