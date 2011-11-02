Received: from fmmailgate04.web.de ([217.72.192.242])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RLj24-00060E-9Y
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2011 22:11:41 +0000
Received: from moweb002.kundenserver.de (moweb002.kundenserver.de
	[172.19.20.108])
	by fmmailgate04.web.de (Postfix) with ESMTP id A02856E928E1
	for <linux-mtd@lists.infradead.org>;
	Wed,  2 Nov 2011 23:11:36 +0100 (CET)
Message-ID: <BBE4319165B44B99893CBAFCC78A34BF@samsungnetbook>
From: "Roland Kletzing" <devzero@web.de>
To: <dedekind1@gmail.com>,
	"Wolfram Sang" <w.sang@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
	<1319919909.2126.15.camel@koala>
In-Reply-To: <1319919909.2126.15.camel@koala>
Subject: Re: [PATCH 1/2] mtd: tests: don't use mtd0 as a default
Date: Wed, 2 Nov 2011 23:11:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"; reply-type=original
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for all your efforts !

--------------------------------------------------
From: "Artem Bityutskiy" <dedekind1@gmail.com>
Sent: Saturday, October 29, 2011 9:25 PM
To: "Wolfram Sang" <w.sang@pengutronix.de>
Cc: <linux-mtd@lists.infradead.org>; "Roland Kletzing" <devzero@web.de>
Subject: Re: [PATCH 1/2] mtd: tests: don't use mtd0 as a default

> On Tue, 2011-10-25 at 11:09 +0200, Wolfram Sang wrote:
>> mtd tests may erase the mtd device, so force the user to specify which
>> mtd device to test by using the module parameter. Disable the default
>> (using mtd0) since this may destroy a vital part of the flash if the
>> module is inserted accidently or carelessly.
>> 
>> Reported-by: Roland Kletzing <devzero@web.de>
>> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> 
> Note, I've pushed this patch to l2-mtd-2.6.git, thanks!
> 
> Artem.
> 
