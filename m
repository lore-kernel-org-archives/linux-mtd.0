Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxMQs-0003De-IL
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 06:14:43 -0400
Message-ID: <42E60C90.5030602@yandex.ru>
Date: Tue, 26 Jul 2005 14:12:32 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>	<20050722115939.GA941@wohnheim.fh-wedel.de>	<42E0E2C8.7090304@yandex.ru>	<42E5E816.5090500@inf.u-szeged.hu>	<20050726074440.GB15903@wohnheim.fh-wedel.de>	<42E5ECE5.4010901@inf.u-szeged.hu>	<42E5F474.7020003@imc-berlin.de>	<20050726093624.GE15903@wohnheim.fh-wedel.de>
	<42E60A81.7070508@inf.u-szeged.hu>
In-Reply-To: <42E60A81.7070508@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> 
> I agree. It would be technically difficult to implement and would make 
> the first mount time very-very long.
> 

Hi Ferenc,

I have no time to look at your patch right now, but I recall there was 
many things like this:

#ifdef SUMMARY
Large block of code. Code is not tidier then the original JFFS2's code. 
If you are in scan.c, you wrote the code using scan.c's style...
#endif

In scan.c for example.

Also I saw large blocks of copy-pasted messy JFFS2 code which is 
slightly changed, and is embraced by #ifdefs. That's not neat.

I'll review your patch later and will be more specific.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
