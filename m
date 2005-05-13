Received: from setabox.com.tw ([220.135.128.161] helo=mail.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DWR5W-0007OL-1S
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 23:43:47 -0400
Message-ID: <42842241.9080302@setabox.com>
Date: Fri, 13 May 2005 11:42:57 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: Munira Ahmed <munira.ahmed@radixs.com>
References: <1115953518.17100.18.camel@server11>
In-Reply-To: <1115953518.17100.18.camel@server11>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mtd driver list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Munira Ahmed wrote:
> Is it possible to get a list of currently registered mtd driver?
> 
> how do I find out which driver is being used currently?
> 
> 
> 
Look at the output of dmesg (or /var/log/messages) after loading your 
driver. Assuming your driver loads correctly you should be able to see 
which mtd devices are in use.

-- 
William J Beksi                          <wjbeksi@users.sourceforge.net>
GPG Key Fingerprint = ED4B 32C3 69E6 C2B7 705C  263F CB2F 3253 E7E1 DB3B
