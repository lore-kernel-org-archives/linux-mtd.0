Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zufuc-0001Nk-0K
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 12:14:34 +0000
Subject: Re: [PATCH 3/5] UBI: Expose the bitrot interface
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
References: <1446764217-15021-1-git-send-email-richard@nod.at>
 <1446764217-15021-4-git-send-email-richard@nod.at>
 <1446811178.20949.111.camel@gmail.com>
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co
From: Richard Weinberger <richard@nod.at>
Message-ID: <563C9990.4040602@nod.at>
Date: Fri, 6 Nov 2015 13:14:08 +0100
MIME-Version: 1.0
In-Reply-To: <1446811178.20949.111.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 06.11.2015 um 12:59 schrieb Artem Bityutskiy:
> On Thu, 2015-11-05 at 23:56 +0100, Richard Weinberger wrote:
>> +#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
>> +#define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)
> 
> Could you please, add short comments telling what are these ioctls
> about.

Sure.

Something like:

+/* Trigger re-read of a given PEB */
+#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
+/* Trigger scrubbing of a given PEB */
+#define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)

?

While we're here, would it make sense to do a manpage for UBI's ioctl()s?

Thanks,
//richard
