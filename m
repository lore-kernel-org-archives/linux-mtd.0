Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKEPh-0003QN-Cu
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 07:13:54 -0400
Message-ID: <41764851.4030207@yandex.ru>
Date: Wed, 20 Oct 2004 15:13:21 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>	
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>	
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>
	<1098180892.13633.1079.camel@hades.cambridge.redhat.com>
	<41762CF9.9030501@inf.u-szeged.hu>
In-Reply-To: <41762CF9.9030501@inf.u-szeged.hu>
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

Hello Ferenc,

I know you are very familiar with compression in JFFS2. Please, could 
you answer me a question.

I have several different buffers. I want to compose one JFFS2 node from 
them. As I understand, I need to allocate one big temporary buffer, copy 
my small buffers to it, and then compress the big buffer. After this I 
will be able to uncompress the compression buffer in one step.

But, it would be very very nice if I can compress each small buffer to 
one compression buffer and later be able to uncompress the resulting 
compression buffer in one step. Can I do so?

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
