Received: from rv-out-0910.google.com ([209.85.198.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J1kz9-0005Gj-0U
	for linux-mtd@lists.infradead.org; Mon, 10 Dec 2007 15:56:06 +0000
Received: by rv-out-0910.google.com with SMTP id c24so1684821rvf
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Dec 2007 07:55:56 -0800 (PST)
Message-ID: <fde666620712100755r5552b5des3e8fb4a64cf574e4@mail.gmail.com>
Date: Mon, 10 Dec 2007 21:25:56 +0530
From: "Vaibhav Hiremath" <hvaibhav@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Issue with flash_*** utilities
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am working with Linux 2.6.18, I am facing some issues with
flash_erase, flash_write utilities. I am using Spansion Flash, in
which lock/unlock is not working. I wanted to debug this issue -

Can anybody tell me where can I find the source code for these utilities?

I am getting error message -

# flash_erase /dev//mtd1
Erase Total 1 Units
Performing Flash Erase of length 131072 at offset 0x0
MTD Erase failure: Read-only file system

Form where it gets printed?


Thanks in advance.

Thanks,
Vaibhav
