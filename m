Message-ID: <4A3F3718.1070102@gmail.com>
Date: Mon, 22 Jun 2009 10:47:36 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: apgmoorthy <moorthy.apg@samsung.com>
Subject: Re: MLC Support in JFFS2
References: <1C48A8694DD447A0A922790E587F7D5F@sisodomain.com>
In-Reply-To: <1C48A8694DD447A0A922790E587F7D5F@sisodomain.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: 'Amit Kumar Sharma' <amitsharma.9@samsung.com>, vishak.g@samsung.com,
	'Amul Saha' <amul.saha@samsung.com>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

apgmoorthy wrote:
> Hi David,
> 
> Currenlty , Is there a way to use JFFS2 with MLC Memories ?
> 
> If not , Felt that any one of the following patch can be of use
> 
> 1. http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html
>           - Which removes the Clean Marker.
> 
> 2. http://lists.infradead.org/pipermail/linux-mtd/2008-September/023101.html
>    http://lists.infradead.org/pipermail/linux-mtd/2008-September/023044.html 
>           - Leaving 1page/Block , for Clean Marker.
> 
> or some other solution, which solves the standoff.   
> 
> Without MLC Support , Flex-OneNAND is unsuable with JFFS2.

Is JFFS2 usable with Flex-OneNAND by design? I thought it would have
to be able to handle paired pages to become MLC-compatible. Does it
do that?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
