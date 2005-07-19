Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DupPQ-0005AO-S3
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 06:33:14 -0400
Message-ID: <42DCD6C1.6010509@yandex.ru>
Date: Tue, 19 Jul 2005 14:32:33 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
References: <42DCD1D3.8070303@cetrtapot.si>
In-Reply-To: <42DCD1D3.8070303@cetrtapot.si>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hinko Kocevar wrote:
> Hi,
> 
> I'm trying to use latest MTD CVS snapshot to create jffs2 image and boot 
> my ARM target using that image as rootfs. Booting halts at:

How did you check that your (probably correct) image was correctly 
written to the flash? May be there are some driver-level problems ? What 
kind of flash is that ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
