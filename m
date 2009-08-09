Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma2AF-0002C9-7P
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 06:45:59 +0000
Message-ID: <4A7E7026.3020806@gmail.com>
Date: Sun, 09 Aug 2009 09:43:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: vimal singh <vimal.newwork@gmail.com>
Subject: Re: [PATCH V5 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
References: <cover.1248434635.git.rubini@unipv.it>	<ce9ab5790907240510y752885b9m2debac82bbdd7401@mail.gmail.com>	<20090724123750.GA25563@mail.gnudd.com>	<ce9ab5790907262328w24946e69wbb2c7977a93aa982@mail.gmail.com>
	<ce9ab5790907270146q6c113aa0qdfee50dea2cf9f2b@mail.gmail.com>
In-Reply-To: <ce9ab5790907270146q6c113aa0qdfee50dea2cf9f2b@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux@arm.linux.org.uk, Alessandro Rubini <rubini-list@gnudd.com>,
	linux-mtd@lists.infradead.org, andrea.gallo@stericsson.com,
	STEricsson_nomadik_linux@list.st.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/27/2009 11:46 AM, vimal singh wrote:
> To make it work for 512 bytes sector ECC in SW, below patch is required:
>
> http://patchwork.ozlabs.org/patch/13697/
>
> Which was posted sometime back, but unfortunately did not get merged.

It is in l2-mtd-2.6.git now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
