Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMrEx-0002TB-7b
	for linux-mtd@lists.infradead.org; Thu, 01 Mar 2007 14:47:03 -0500
Message-ID: <45E72C1F.4050308@ru.mvista.com>
Date: Thu, 01 Mar 2007 22:40:15 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: JFFS2 file system slowly filling up for unknown reason ~20	seconds
	after mount
References: <1172774513.20708.40.camel@localhost>
	<1172773269.17031.42.camel@sauron>
In-Reply-To: <1172773269.17031.42.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Josh Green <josh@resonance.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

>>Linux kernel 2.6.10 with patch from Philips
>>    
>>
>
>Ancient kernel, not a lot of people are interested in digging it.
>  
>
Absolutely, especially given the possible side effects of the "patch
from Philips" no one here has actually seen ;-)
What I'd suggest is to try quickporting the board support and flash
driver to the latest community kernel and reproducing the problem with
this new setup.

Vitaly
