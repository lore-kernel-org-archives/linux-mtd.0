Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKEyb-00045P-FC
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 07:49:59 -0400
Message-ID: <417651AD.50001@inf.u-szeged.hu>
Date: Wed, 20 Oct 2004 13:53:17 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>	
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>	
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>
	<1098180892.13633.1079.camel@hades.cambridge.redhat.com>
	<41762CF9.9030501@inf.u-szeged.hu> <41764851.4030207@yandex.ru>
In-Reply-To: <41764851.4030207@yandex.ru>
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

Hi Artem,

> I have several different buffers. I want to compose one JFFS2 node from 
> them. As I understand, I need to allocate one big temporary buffer, copy 
> my small buffers to it, and then compress the big buffer. After this I 
> will be able to uncompress the compression buffer in one step.
> 
> But, it would be very very nice if I can compress each small buffer to 
> one compression buffer and later be able to uncompress the resulting 
> compression buffer in one step. Can I do so?

If the "one step" means that you would like to use only one 
jffs2_decompress/... call than the answer is no.

But I can imagine a solution, where you can call jffs2_compress 
separatedly for the small buffers, and you can uncompress it using a loop.

The compression buffer can be something like the following:
   - original_size_of_small_buffer1
   - compressed_size_of_small_buffer1
   - comprtype (return value of jffs2_compress)
   - compressed data1
   - original_size_of_small_buffer2
   - compressed_size_of_small_buffer2
   - comprtype (return value of jffs2_compress)
   - compressed data2
   ...

I don't know it is OK for you or not.

Bye,
Ferenc

P.S.: In this solution you may have to allign all data to 4 bytes.
