Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4F4EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IcnCxW//DwR5zXtG/koKWf2AiN1ujr6YXPbyPNhpCKs=; b=WOwIU/KA3sLanj
	4hWbbjO/BtML+mKiDRWABIV/fgOMrva8S09ndFxgx1FSjs4Y80klN8Al2/NPXCVodj1l0zo/y0jeL
	452QNi/My/HUyJch8a43AC/Eb7/ZUPoIaSHmXrRRMXh5ofhaQ3EwzWeECczc5QJNoxxU96RfF+Pdz
	7HdcpC+f4XW02OnO/il30aienw59jvvcsNn1QOsTuCl7sWltirKLYR+b+h8Kzol0bvs2TtNULk7Fe
	mH9BwL62LTakbVpdnBWudjsYj/IEydp4Ud4qG8AE2+yieJXCjljOkJ7UcN3M28/FyNl1fYQFy0Epd
	jgVuvA4UHJ7DQzzZtomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcMd-000Syp-1y;
	Wed, 12 Jul 2023 16:06:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcMa-000SxR-2A
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 16:06:49 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so11538959e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 09:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1689178006; x=1691770006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X6ArMXh62A5UxRR3ZN+q1CvObhoeb8ltfmXU1xj+zw=;
        b=V0Mwyzpfv5NHo344FebMkemb4OkDhqesSJzk3oLJrC1sXingJzi/DqoHJPX3cM7/kU
         /daZbGumusx7p3ETz9bL+dV7+a249DzrdJ5ucaxUqFs1cH4q4UNK1aBbCP0kRMVezgvK
         Gb0u18D1omT5qk875/bvJSIuyWWXlLKu5WnA0OT929rTcOY7rHqZVsWOvIcdQTq+Q4TI
         Xty8IQiQ2uEFjkBqRHhjaYUeIIjdk3TlKuW6ZBNL29/kZI8LKdOXvAAi+FiRNxSMUXsG
         92h/diWQ5jGfG/Pc/9JTOLcLZ2bS8Hyd3sIfxIs/rFITeR6YjIQmonhcUevYE5m/zN7s
         SmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178006; x=1691770006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8X6ArMXh62A5UxRR3ZN+q1CvObhoeb8ltfmXU1xj+zw=;
        b=clXTNSrlwOqpiNaqLlxtWS61xAT0viXmpCHQp4AZkv4ITLar0Zj0rb5QHiMqL4+HTk
         VyDwhiaFOEe9nYFp3yVziF4eUFZkx1nuMG7dv6h7YCXg+nqKZFmu42j8/zXsR42Ko3LG
         07t/UuQwLN8r7sO3SGcjBv8pvil1pvF02Ifp4i8tAyHcq7NMmCFsewBp4wj+MkmHqCXg
         RGrxcYVoC3cBkSe/nA6tm0h88I4vamsWDwOtfd9CPb1R+KlGXTfflWi6SM6yppuTmAaD
         kLZy8K5lsY301qmEmmrcHDwZNtOVKC+n1DFbZNzWmNnmmCPv80ESRlkPf61cuPABClW2
         nGow==
X-Gm-Message-State: ABy/qLah1cpOSO+VAH2R7O21kPne/WswS9YLehRX73zj40H4p6OJKNQ/
	7ftxB/MWYpS+Fr8XBLXZOpRavFV+jfSBaK0T0fVCuw==
X-Google-Smtp-Source: APBJJlHjPtNIqZNhhKZT3JSG1orBAozCwd3+TwwvFjulJuToD7D5iIrA7grwKZQU8Z67qc0UJ0oDxWof6WbkdfMRi3A=
X-Received: by 2002:ac2:5b1d:0:b0:4fb:7a90:1abe with SMTP id
 v29-20020ac25b1d000000b004fb7a901abemr15797051lfn.49.1689178006211; Wed, 12
 Jul 2023 09:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230629165206.383-1-jack@suse.cz> <20230704122224.16257-1-jack@suse.cz>
 <ZKbgAG5OoHVyUKOG@infradead.org>
In-Reply-To: <ZKbgAG5OoHVyUKOG@infradead.org>
From: Haris Iqbal <haris.iqbal@ionos.com>
Date: Wed, 12 Jul 2023 18:06:35 +0200
Message-ID: <CAJpMwyiUcw+mH0sZa8f8UJsaSZ7NSE65s2gZDEia+pASyP_gJQ@mail.gmail.com>
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
To: Christoph Hellwig <hch@infradead.org>
Cc: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
	Alasdair Kergon <agk@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>, dm-devel@redhat.com, 
	drbd-dev@lists.linbit.com, Gao Xiang <xiang@kernel.org>, 
	Jack Wang <jinpu.wang@ionos.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	jfs-discussion@lists.sourceforge.net, Joern Engel <joern@lazybastard.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, Kent Overstreet <kent.overstreet@gmail.com>, 
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org, 
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org, 
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>, 
	Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com, 
	reiserfs-devel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, target-devel@vger.kernel.org, 
	Ted Tso <tytso@mit.edu>, Trond Myklebust <trond.myklebust@hammerspace.com>, 
	xen-devel@lists.xenproject.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_090648_708700_96802332 
X-CRM114-Status: GOOD (  15.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgNiwgMjAyMyBhdCA1OjM44oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDA0LCAyMDIzIGF0IDAyOjIxOjI4
UE0gKzAyMDAsIEphbiBLYXJhIHdyb3RlOgo+ID4gQ3JlYXRlIHN0cnVjdCBiZGV2X2hhbmRsZSB0
aGF0IGNvbnRhaW5zIGFsbCBwYXJhbWV0ZXJzIHRoYXQgbmVlZCB0byBiZQo+ID4gcGFzc2VkIHRv
IGJsa2Rldl9wdXQoKSBhbmQgcHJvdmlkZSBibGtkZXZfZ2V0X2hhbmRsZV8qIGZ1bmN0aW9ucyB0
aGF0Cj4gPiByZXR1cm4gdGhpcyBzdHJ1Y3R1cmUgaW5zdGVhZCBvZiBwbGFpbiBiZGV2IHBvaW50
ZXIuIFRoaXMgd2lsbAo+ID4gZXZlbnR1YWxseSBhbGxvdyB1cyB0byBwYXNzIG9uZSBtb3JlIGFy
Z3VtZW50IHRvIGJsa2Rldl9wdXQoKSB3aXRob3V0Cj4gPiB0b28gbXVjaCBoYXNzbGUuCj4KPiBD
YW4gd2UgdXNlIHRoZSBvcHBvcnR1bml0eSB0byBjb21lIHVwIHdpdGggYmV0dGVyIG5hbWVzPyAg
YmxrZGV2X2dldF8qCj4gd2FzIGFsd2F5cyBhIHJhdGhlciBob3JyaWJsZSBuYW1pbmcgY29udmVu
dGlvbiBmb3Igc29tZXRoaW5nIHRoYXQKPiBlbmRzIHVwIGNhbGxpbmcgaW50byAtPm9wZW4uCj4K
PiBXaGF0IGFib3V0Ogo+Cj4gc3RydWN0IGJkZXZfaGFuZGxlICpiZGV2X29wZW5fYnlfZGV2KGRl
dl90IGRldiwgYmxrX21vZGVfdCBtb2RlLCB2b2lkICpob2xkZXIsCj4gICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCBibGtfaG9sZGVyX29wcyAqaG9wcyk7Cj4gc3RydWN0IGJkZXZfaGFuZGxl
ICpiZGV2X29wZW5fYnlfcGF0aChkZXZfdCBkZXYsIGJsa19tb2RlX3QgbW9kZSwKPiAgICAgICAg
ICAgICAgICAgdm9pZCAqaG9sZGVyLCBjb25zdCBzdHJ1Y3QgYmxrX2hvbGRlcl9vcHMgKmhvcHMp
Owo+IHZvaWQgYmRldl9yZWxlYXNlKHN0cnVjdCBiZGV2X2hhbmRsZSAqaGFuZGxlKTsKCisxIHRv
IHRoaXMuCkFsc28sIGlmIHdlIGFyZSByZW1vdmluZyAiaGFuZGxlIiBmcm9tIHRoZSBmdW5jdGlv
biwgc2hvdWxkIHRoZSBuYW1lCm9mIHRoZSBzdHJ1Y3R1cmUgaXQgcmV0dXJucyBhbHNvIGNoYW5n
ZT8gV291bGQgc29tZXRoaW5nIGxpa2UgYmRldl9jdHgKYmUgYmV0dGVyPwoKKEFwb2xvZ2llcyBm
b3IgdGhlIHByZXZpb3VzIG5vbi1wbGFpbnRleHQgZW1haWwpCgo+Cj4gPwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
