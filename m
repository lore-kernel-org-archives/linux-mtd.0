Received: from mailserv.intranet.gr ([146.124.14.106])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C76mp-0007o7-E2
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2004 02:27:33 -0400
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.13.1/8.13.1) with ESMTP id i8E6Rf1w025600
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Sep 2004 09:27:41 +0300 (EEST)
Message-ID: <41468E01.10806@intracom.gr>
Date: Tue, 14 Sep 2004 09:21:53 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: tharbaugh@lnxi.com
References: <41457C48.8040100@intracom.gr> <1095096422.5442.4.camel@tubarao>
In-Reply-To: <1095096422.5442.4.camel@tubarao>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Support Macronix MX29LV040C
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thayne Harbaugh wrote:
> On Mon, 2004-09-13 at 13:54 +0300, Pantelis Antoniou wrote:
> 
>>Hello
>>
>>The following patch adds support for the Macronix MX29LV040C to
>>jedec_probe chip driver.
> 
> 
> Thanks.
> 
> Applied.
> 
> I had to shuffle things with the patch because the device wasn't sorted
> correctly WRT the other devices in jedec_table[] 8(.
> 
> 
> 
> 

The table is sorted? :)

Regards

Pantelis
