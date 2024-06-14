Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3073FC27C6E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2024 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J35t5Wb8F/yrlC/PW9vTrIE+7CZxHjM+ZJ67L5xmy+o=; b=qi6NF0OuRbsIIj
	xl3/ojZCO4y+keHXruGgxUz3BTJo0ZZ9OXvCrCZHiNNjLKKStWkoX5CVt/LldYXOG878BQaOL7yBJ
	HD26gmij0CHAf+CLRmubteJy59Uhqq3unfPC2J9Q9sHmht6Xh3y2UFkJACalOYk/sE/yldweGvT6W
	urAyfT2llzUUUe27zEDPv1Jv24/xWhOd5gsooNGpXkBhfwkjq1KqVUbLcm9O/PCo932ZrP+CQug6h
	VjiLrWh6s7Iwk2+butO02/lk9cdZwaUzY5dWqZpTKgo13xxkgT1yk7KgqQlxWRnNxh8zVxHWBvQpU
	YMb/T7UJASJZI+q48LAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1nr-00000001s0b-2Odz;
	Fri, 14 Jun 2024 07:56:55 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1nl-00000001ryW-3oj5
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jun 2024 07:56:52 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-43ffbc0927fso10911301cf.3
        for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2024 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718351805; x=1718956605; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BedO1x12znmji4xt7UpC8XDe1FvgdzsEI86mvlWGudA=;
        b=RaIl4x/adI/HuNOc3VwbvU4uzLYKtkqKRWQ80BHrpZC5GbHDiZnP4JzreUyoFVzgqt
         9xw9ntMGnEtX/px4pV4l1WCY/aB/VN6z86GjIstb0stV2pbCIJKqw1tS0JdlPWeUHJGX
         AZ+F+C17IleGHh1XY9koLX+jaBCQVbz3P3FAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718351805; x=1718956605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BedO1x12znmji4xt7UpC8XDe1FvgdzsEI86mvlWGudA=;
        b=T+1wfidHrA6Xxugza8i/4b35bncjY/+PXdbhQGWiv7zU807N84QA8nPO5o0Q527FFZ
         At/uwT1Sji8GmGkVHlyVzjWmV3iQVDRimORVZ88UgPboZCwntruE+8PXypyxvhOMAfkR
         6EJSQIyUMqua6cqIoAIXqTeogan/X1GR75ef11k7aYRifz1AqQHWLxIbDZmt209T0qgf
         CSQ4btcDnyFDSsLaqbFWaivh2JOV2WY9Xrj4wGmySaxEut1lUpnM9hGqX6ahWJJe6QRb
         KnTp8cY15gCHnZvGbRcJX7L1QWYBuat82/CUVFqFd3yPtfuPlCZnSu7xvOcl+keLH2cq
         v5ew==
X-Forwarded-Encrypted: i=1; AJvYcCUvYKRrU3SpJasMwCy/zl5DgIDpZQ9x3QidJTGjD8uhitigSJ+i5lRfRBnbdwzhKhKi5rNUHblmsQNuBvDddvpXLbVl1MWQtzdS2tdJ8w==
X-Gm-Message-State: AOJu0Ywm/L1yINLivb5PprOPlIyYE9skPQOH05zuGN1lZOGwpH3eYiT2
	RABl/19HmXBjchcShnlsPO0V7mR2uRhyYV6jPjBP12TQ7Y7RLJz3OXhgiKCW/Y0=
X-Google-Smtp-Source: AGHT+IEDi8BhVjLu2vbVbmBxB83hP6gyIibQXt+H84ODwaVrhmTedMPZYFZeMGGsfo/+7hGiDnXdRg==
X-Received: by 2002:a05:622a:1822:b0:43e:2639:a987 with SMTP id d75a77b69052e-44216b3a874mr27744421cf.59.1718351804940;
        Fri, 14 Jun 2024 00:56:44 -0700 (PDT)
Received: from localhost ([213.195.124.163])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f2ff9ef8sm13823221cf.89.2024.06.14.00.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:56:44 -0700 (PDT)
Date: Fri, 14 Jun 2024 09:56:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when
 they fail
Message-ID: <Zmv3usMvGGK7ZbMT@macbook>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-11-hch@lst.de>
 <ZmlVziizbaboaBSn@macbook>
 <20240612150030.GA29188@lst.de>
 <ZmnFH17bTV2Ot_iR@macbook>
 <20240613140508.GA16529@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613140508.GA16529@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_005650_137144_D20B3168 
X-CRM114-Status: GOOD (  47.97  )
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

T24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgMDQ6MDU6MDhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTIsIDIwMjQgYXQgMDU6NTY6MTVQTSArMDIwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IFJpZ2h0LiAgQUZBSUNUIGFkdmVydGlzaW5nICJmZWF0
dXJlLWJhcnJpZXIiIGFuZC9vcgo+ID4gImZlYXR1cmUtZmx1c2gtY2FjaGUiIGNvdWxkIGJlIGRv
bmUgYmFzZWQgb24gd2hldGhlciBibGtiYWNrCj4gPiB1bmRlcnN0YW5kIHRob3NlIGNvbW1hbmRz
LCBub3Qgb24gd2hldGhlciB0aGUgdW5kZXJseWluZyBzdG9yYWdlCj4gPiBzdXBwb3J0cyB0aGUg
ZXF1aXZhbGVudCBvZiB0aGVtLgo+ID4gCj4gPiBXb3JzdCBjYXNlIHdlIGNhbiBwcmludCBhIHdh
cm5pbmcgbWVzc2FnZSBvbmNlIGFib3V0IHRoZSB1bmRlcmx5aW5nCj4gPiBzdG9yYWdlIGZhaWxp
bmcgdG8gY29tcGxldGUgZmx1c2gvYmFycmllciByZXF1ZXN0cywgYW5kIHRoYXQgZGF0YQo+ID4g
aW50ZWdyaXR5IG1pZ2h0IG5vdCBiZSBndWFyYW50ZWVkIGdvaW5nIGZvcndhcmQsIGFuZCBub3Qg
cHJvcGFnYXRlIHRoZQo+ID4gZXJyb3IgdG8gdGhlIHVwcGVyIGxheWVyPwo+ID4gCj4gPiBXaGF0
IHdvdWxkIGJlIHRoZSBjb25zZXF1ZW5jZSBvZiBwcm9wYWdhdGluZyBhIGZsdXNoIGVycm9yIHRv
IHRoZQo+ID4gdXBwZXIgbGF5ZXJzPwo+IAo+IElmIHlvdSBwcm9wYWdlIHRoZSBlcnJvciB0byB0
aGUgdXBwZXIgbGF5ZXIgeW91IHdpbGwgZ2VuZXJhdGUgYW4KPiBJL08gZXJyb3IgdGhlcmUsIHdo
aWNoIHVzdWFsbHkgbGVhZHMgdG8gYSBmaWxlIHN5c3RlbSBzaHV0ZG93bi4KPiAKPiA+IEdpdmVu
IHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgZmVhdHVyZSBpbiB0aGUgYmxraWYgaGVhZGVyLCBJJ20g
YWZyYWlkCj4gPiB3ZSBjYW5ub3QgZ3VhcmFudGVlIHRoYXQgc2VlaW5nIHRoZSBmZWF0dXJlIGV4
cG9zZWQgaW1wbGllcyBiYXJyaWVyIG9yCj4gPiBmbHVzaCBzdXBwb3J0LCBzaW5jZSB0aGUgcmVx
dWVzdCBjb3VsZCBmYWlsIGF0IGFueSB0aW1lIChvciBldmVuIGZyb20KPiA+IHRoZSBzdGFydCBv
ZiB0aGUgZGlzayBhdHRhY2htZW50KSBhbmQgaXQgd291bGQgc3RpbGwgc2FkbHkgYmUgYSBjb3Jy
ZWN0Cj4gPiBpbXBsZW1lbnRhdGlvbiBnaXZlbiB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIG9wdGlv
bnMuCj4gCj4gV2VsbCwgdGhlbiB3ZSBjb3VsZCBkbyBzb21ldGhpbmcgbGlrZSB0aGUgcGF0Y2gg
YmVsb3csIHdoaWNoIGtlZXBzCj4gdGhlIGV4aXN0aW5nIGJlaGF2aW9yLCBidXQgaW5zb2xhdGVz
IHRoZSBibG9jayBsYXllciBmcm9tIGl0IGFuZAo+IHJlbW92ZXMgdGhlIG9ubHkgdXNlciBvZiBi
bGtfcXVldWVfd3JpdGVfY2FjaGUgZnJvbSBpbnRlcnJ1cHQKPiBjb250ZXh0OgoKTEdUTSwgSSdt
IG5vdCBzdXJlIHRoZXJlJ3MgbXVjaCBlbHNlIHdlIGNhbiBkby4KCj4gLS0tCj4gRnJvbSBlNmU4
MmM3NjlhYjIwOWE3NzMwMjk5NGMzODI5Y2Y2ZmY3YTU5NWI4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQo+IEZyb206IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IERhdGU6IFRodSwg
MzAgTWF5IDIwMjQgMDg6NTg6NTIgKzAyMDAKPiBTdWJqZWN0OiB4ZW4tYmxrZnJvbnQ6IGRvbid0
IGRpc2FibGUgY2FjaGUgZmx1c2hlcyB3aGVuIHRoZXkgZmFpbAo+IAo+IGJsa2Zyb250IGFsd2F5
cyBoYWQgYSByb2J1c3QgbmVnb3RpYXRpb24gcHJvdG9jb2wgZm9yIGRldGVjdGluZyBhIHdyaXRl
Cj4gY2FjaGUuICBTdG9wIHNpbXBseSBkaXNhYmxpbmcgY2FjaGUgZmx1c2hlcyBpbiB0aGUgYmxv
Y2sgbGF5ZXIgYXMgdGhlCj4gZmxhZ3MgaGFuZGxpbmcgaXMgbW92aW5nIHRvIHRoZSBhdG9taWMg
cXVldWUgbGltaXRzIEFQSSB0aGF0IG5lZWRzCj4gdXNlciBjb250ZXh0IHRvIGZyZWV6ZSB0aGUg
cXVldWUgZm9yIHRoYXQuICBJbnN0ZWFkIGhhbmRsZSB0aGUgY2FzZQo+IG9mIHRoZSBmZWF0dXJl
IGZsYWdzIGNsZWFyZWQgaW5zaWRlIG9mIGJsa2Zyb250LiAgVGhpcyByZW1vdmVzIG9sZAo+IGRl
YnVnIGNvZGUgdG8gY2hlY2sgZm9yIHN1Y2ggYSBtaXNtYXRjaCB3aGljaCB3YXMgcHJldmlvdXNs
eSBpbXBvc3NpYmxlCj4gdG8gaGl0LCBpbmNsdWRpbmcgdGhlIGNoZWNrIGZvciBwYXNzdGhyb3Vn
aCByZXF1ZXN0cyB0aGF0IGJsa2Zyb250Cj4gbmV2ZXIgdXNlZCB0byBzdGFydCB3aXRoLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBk
cml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIHwgNDQgKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPiBpbmRleCA5YjRlYzNlNDkwOGNjZS4uZTJj
OTJkNTA5NWZmMTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+
ICsrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPiBAQCAtNzg4LDYgKzc4OCwxNCBA
QCBzdGF0aWMgaW50IGJsa2lmX3F1ZXVlX3J3X3JlcShzdHJ1Y3QgcmVxdWVzdCAqcmVxLCBzdHJ1
Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaQo+ICAJCQkgKiBBIGJhcnJpZXIgcmVxdWVzdCBhIHN1
cGVyc2V0IG9mIEZVQSwgc28gd2UgY2FuCj4gIAkJCSAqIGltcGxlbWVudCBpdCB0aGUgc2FtZSB3
YXkuICAoSXQncyBhbHNvIGEgRkxVU0grRlVBLAo+ICAJCQkgKiBzaW5jZSBpdCBpcyBndWFyYW50
ZWVkIG9yZGVyZWQgV1JUIHByZXZpb3VzIHdyaXRlcy4pCj4gKwkJCSAqCj4gKwkJCSAqIE5vdGUg
dGhhdCBjYW4gZW5kIHVwIGhlcmUgd2l0aCBhIEZVQSB3cml0ZSBhbmQgdGhlCj4gKwkJCSAqIGZs
YWdzIGNsZWFyZWQuICBUaGlzIGhhcHBlbnMgd2hlbiB0aGUgZmxhZyB3YXMKPiArCQkJICogcnVu
LXRpbWUgZGlzYWJsZWQgYW5kIHJhY2VkIHdpdGggSS9PIHN1Ym1pc3Npb24gaW4KPiArCQkJICog
dGhlIGJsb2NrIGxheWVyLiAgV2Ugc3VibWl0IGl0IGFzIGEgbm9ybWFsIHdyaXRlCgpTaW5jZSBi
bGtmcm9udCBubyBsb25nZXIgc2lnbmFscyB0aGF0IEZVQSBpcyBubyBsb25nZXIgYXZhaWxhYmxl
IGZvciB0aGUKZGV2aWNlLCBnZXR0aW5nIGEgcmVxdWVzdCB3aXRoIEZVQSBpcyBub3QgYWN0dWFs
bHkgYSByYWNlIEkgdGhpbms/Cgo+ICsJCQkgKiBoZXJlLiAgQSBwdXJlIGZsdXNoIHNob3VsZCBu
ZXZlciBlbmQgdXAgaGVyZSB3aXRoCj4gKwkJCSAqIHRoZSBmbGFncyBjbGVhcmVkIGFzIHRoZXkg
YXJlIGNvbXBsZXRlZCBlYXJsaWVyIGZvcgo+ICsJCQkgKiB0aGUgIWZlYXR1cmVfZmx1c2ggY2Fz
ZS4KPiAgCQkJICovCj4gIAkJCWlmIChpbmZvLT5mZWF0dXJlX2ZsdXNoICYmIGluZm8tPmZlYXR1
cmVfZnVhKQo+ICAJCQkJcmluZ19yZXEtPm9wZXJhdGlvbiA9Cj4gQEAgLTc5NSw4ICs4MDMsNiBA
QCBzdGF0aWMgaW50IGJsa2lmX3F1ZXVlX3J3X3JlcShzdHJ1Y3QgcmVxdWVzdCAqcmVxLCBzdHJ1
Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaQo+ICAJCQllbHNlIGlmIChpbmZvLT5mZWF0dXJlX2Zs
dXNoKQo+ICAJCQkJcmluZ19yZXEtPm9wZXJhdGlvbiA9Cj4gIAkJCQkJQkxLSUZfT1BfRkxVU0hf
RElTS0NBQ0hFOwo+IC0JCQllbHNlCj4gLQkJCQlyaW5nX3JlcS0+b3BlcmF0aW9uID0gMDsKPiAg
CQl9Cj4gIAkJcmluZ19yZXEtPnUucncubnJfc2VnbWVudHMgPSBudW1fZ3JhbnQ7Cj4gIAkJaWYg
KHVubGlrZWx5KHJlcXVpcmVfZXh0cmFfcmVxKSkgewo+IEBAIC04ODcsMTYgKzg5Myw2IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9yZXF1ZXN0cyhzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZv
ICpyaW5mbykKPiAgCQlub3RpZnlfcmVtb3RlX3ZpYV9pcnEocmluZm8tPmlycSk7Cj4gIH0KPiAg
Cj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBibGtpZl9yZXF1ZXN0X2ZsdXNoX2ludmFsaWQoc3RydWN0
IHJlcXVlc3QgKnJlcSwKPiAtCQkJCQkgICAgICAgc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8p
Cj4gLXsKPiAtCXJldHVybiAoYmxrX3JxX2lzX3Bhc3N0aHJvdWdoKHJlcSkgfHwKPiAtCQkoKHJl
cV9vcChyZXEpID09IFJFUV9PUF9GTFVTSCkgJiYKPiAtCQkgIWluZm8tPmZlYXR1cmVfZmx1c2gp
IHx8Cj4gLQkJKChyZXEtPmNtZF9mbGFncyAmIFJFUV9GVUEpICYmCj4gLQkJICFpbmZvLT5mZWF0
dXJlX2Z1YSkpOwo+IC19Cj4gLQo+ICBzdGF0aWMgYmxrX3N0YXR1c190IGJsa2lmX3F1ZXVlX3Jx
KHN0cnVjdCBibGtfbXFfaHdfY3R4ICpoY3R4LAo+ICAJCQkgIGNvbnN0IHN0cnVjdCBibGtfbXFf
cXVldWVfZGF0YSAqcWQpCj4gIHsKPiBAQCAtOTA4LDIzICs5MDQsMzAgQEAgc3RhdGljIGJsa19z
dGF0dXNfdCBibGtpZl9xdWV1ZV9ycShzdHJ1Y3QgYmxrX21xX2h3X2N0eCAqaGN0eCwKPiAgCXJp
bmZvID0gZ2V0X3JpbmZvKGluZm8sIHFpZCk7Cj4gIAlibGtfbXFfc3RhcnRfcmVxdWVzdChxZC0+
cnEpOwo+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJnJpbmZvLT5yaW5nX2xvY2ssIGZsYWdzKTsKPiAt
CWlmIChSSU5HX0ZVTEwoJnJpbmZvLT5yaW5nKSkKPiAtCQlnb3RvIG91dF9idXN5Owo+ICAKPiAt
CWlmIChibGtpZl9yZXF1ZXN0X2ZsdXNoX2ludmFsaWQocWQtPnJxLCByaW5mby0+ZGV2X2luZm8p
KQo+IC0JCWdvdG8gb3V0X2VycjsKPiArCS8qCj4gKwkgKiBDaGVjayBpZiB0aGUgYmFja2VuZCBh
Y3R1YWxseSBzdXBwb3J0cyBmbHVzaGVzLgo+ICsJICoKPiArCSAqIFdoaWxlIHRoZSBibG9jayBs
YXllciB3b24ndCBzZW5kIHVzIGZsdXNoZXMgaWYgd2UgZG9uJ3QgY2xhaW0gdG8KPiArCSAqIHN1
cHBvcnQgdGhlbSwgdGhlIFhlbiBwcm90b2NvbCBhbGxvd3MgdGhlIGJhY2tlbmQgdG8gcmV2b2tl
IHN1cHBvcnQKPiArCSAqIGF0IGFueSB0aW1lLiAgVGhhdCBpcyBvZiBjb3Vyc2UgYSByZWFsbHkg
YmFkIGlkZWEgYW5kIGRhbmdlcm91cywgYnV0Cj4gKwkgKiBoYXMgYmVlbiBhbGxvd2VkIGZvciAx
MCsgeWVhcnMuICBJbiB0aGF0IGNhc2Ugd2Ugc2ltcGx5IGNsZWFyIHRoZQo+ICsJICogZmxhZ3Ms
IGFuZCBkaXJlY3RseSByZXR1cm4gaGVyZSBmb3IgYW4gZW1wdHkgZmx1c2ggYW5kIGlnbm9yZSB0
aGUKPiArCSAqIEZVQSBmbGFnIGxhdGVyIG9uLgo+ICsJICovCj4gKwlpZiAodW5saWtlbHkocmVx
X29wKHFkLT5ycSkgPT0gUkVRX09QX0ZMVVNIICYmICFpbmZvLT5mZWF0dXJlX2ZsdXNoKSkKPiAr
CQlnb3RvIG91dDsKCkRvbid0IHlvdSBuZWVkIHRvIGNvbXBsZXRlIHRoZSByZXF1ZXN0IGhlcmU/
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
