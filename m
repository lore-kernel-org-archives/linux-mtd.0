Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkDDP-0001CH-8p
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 06:58:27 +0000
Message-ID: <47FF0ADA.7010101@nokia.com>
Date: Fri, 11 Apr 2008 09:53:14 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "ext Bruce_Leonard@selinc.com" <Bruce_Leonard@selinc.com>
Subject: Re: mtd->size revisited
References: <OF1E779C97.22C47CCA-ON88257426.007A4C73-88257426.007C6F5B@selinc.com>
In-Reply-To: <OF1E779C97.22C47CCA-ON88257426.007A4C73-88257426.007C6F5B@selinc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bruce_Leonard@selinc.com wrote:
> This could end up going a long way.  Plus, I know there are a couple of 
> drivers that make use of this field and I expect that if I make this 
> change, I'll be responsible for makeing the changes to the drivers. 
> However, I can't test those changes since I don't have the HW.  How is 
> that going to be received by the community and the maintainers of those 
> drivers?

I would suggest making 64-bit size support a config option and not touching
any code you don't have to for your device.

This reduces the amount of work you have to do and leaves 32-bit people
unaffected.
