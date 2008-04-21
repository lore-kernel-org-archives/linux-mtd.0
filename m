Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JnrYY-0002g3-D5
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 08:39:22 +0000
Message-ID: <480C516A.5030105@nokia.com>
Date: Mon, 21 Apr 2008 11:33:46 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Abhijit Singh <mail2abhijit@gmail.com>
Subject: Re: inconsistent behaviour with onenand with 2.6.24 kernel
References: <60e9ed290804170851y17cd9ea8nbb2531275eb899fb@mail.gmail.com>	
	<48084B80.2050601@nokia.com>
	<60e9ed290804202339v14b04468hafdbc9e088bee4fe@mail.gmail.com>
In-Reply-To: <60e9ed290804202339v14b04468hafdbc9e088bee4fe@mail.gmail.com>
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

Abhijit Singh wrote:
> I have tried all the above mentioned patches. But the status is same.
> behaviour is inconsistent.
> It still leads to system hangs while writing big files. Any other pointers ?
> But it is working fine on 2.6.20 kernel.

That was the only problem I knew of.

You will need to dump the task list (using sysrq) when it hangs and try
to work out where it is stuck.
