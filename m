Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ErG1j-0007yc-Ae
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2005 09:42:13 -0500
Message-ID: <43B1529F.3070601@yandex.ru>
Date: Tue, 27 Dec 2005 17:41:35 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Alexey, Korolev" <alexey.korolev@intel.com>
References: <43AFA856.6010901@intel.com>
In-Reply-To: <43AFA856.6010901@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD + 2.6.13/2.6.14 OOPS in class_device_create()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey, Korolev wrote:
> Artem,
> 
> I can't compile 2.6.14 kernel after applying the latest mtd snapshot.
> mtd_class_device_create - function is not defined.
> 
> Here is a small hotfix :)

Oh, pardon. Fixed, thanks.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
