Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONjpH-000806-HL
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 09:50:00 +0000
Subject: Re: detecting that ubifs switched to ro after problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <AANLkTik2mO4lpL5QA1kzMf4zp-Prd-SdhSNLVcHB9isl@mail.gmail.com>
References: <AANLkTik2mO4lpL5QA1kzMf4zp-Prd-SdhSNLVcHB9isl@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 12:47:34 +0300
Message-ID: <1276422454.19028.209.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-06-11 at 22:46 -0400, Jon Ringle wrote:
> Hi,
> 
> I'd like to be able to somehow detect that ubifs has taken the action
> of switching from rw to ro due to some error detected in the ubifs
> filesystem. If I can detect this then maybe I can do something about
> it, such as copying the ubifs contents to a .tar.bz2 in /tmp,
> mkfs.ubifs, and restore .tar.bz2 back again.
> 
> Is there a way I can do this?

I think with 2fde99cb55fb9d9b88180512a5e8a5d939d27fec you can check for
R/O state from /proc/mounts. Also, you can use something like inotify to
watch /proc/mounts changes and react if UBIFS became r/o.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
