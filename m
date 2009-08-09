Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma0Ub-0004WX-DA
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 04:58:53 +0000
Message-ID: <4A7E56EB.4050207@gmail.com>
Date: Sun, 09 Aug 2009 07:56:11 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Erno Kuusela <erno@gulp.u--3.com>
Subject: Re: UBIFS fails & crashes on SheevaPlug
References: <20090723185928.GA1612@gulp.u--3.com> <4A694C3C.4010108@gmail.com>
	<20090724131241.GC1792@gulp.u--3.com> <4A69C763.1070008@gmail.com>
	<20090726153536.GD1792@gulp.u--3.com>
In-Reply-To: <20090726153536.GD1792@gulp.u--3.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: debian-arm@lists.debian.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/26/2009 06:35 PM, Erno Kuusela wrote:
> There was one more error (for benefit of anyone else hitting the same
> problem): mkfs.ubifs -e 129024 parameter from
> http://www.plugcomputer.org/plugwiki/index.php/Enabling_UBIFS#Make_ubi_image_out_of_the_ubifs
> didn't work for me (got "validate_sb: LEB size mismatch: 129024 in
> superblock, 126976 real"). Fixing this to the number indicated in the
> error message (126976) fixed it.

Yes, I've just also created this FAQ entry:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_lebsz_mismatch

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
