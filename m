Return-Path: <SRS0=MDdG=PS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4E3C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Oct 2021 18:05:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81EF260E90
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Oct 2021 18:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81EF260E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ts3card.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZstRxMgHkiAOyylIU6inwN/uTY3Yd8lNn4WQwcKqU/w=; b=4oW/v+q1X0EgpX
	xwqeWGW9uqbrRDYIeR+gNGpn779FHn+nGUFQph63TaEuIpNvI8huCR5nZz7UDFydq27xHYIVHHWv/
	TTgOLPvwA+/IfOlpXYE9L1jHIIhGEVT8QBFBVtuXkbcVnYyt0DZdf9dQ9teXiR7uGGrOjh1EEMEtK
	rP1T51AmV3L0IeouIwQOTIrE+E7Nv6oIsyoLI6AcJYKlMcygxV8QOwvWfgqABIbV9pt3nYvBbUZP7
	ysW3jzpoCDFYo50ITJQYMAwV4VW9JO4HVltjx68BYwmv7Rn1iRvYhzQIo7Qj8mKNt+FYeyYrhM01l
	e5tgWNkD3WtLq9hnvTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgsiz-00DP9r-O8; Sat, 30 Oct 2021 18:05:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgsiw-00DP8c-LS
 for linux-mtd@bombadil.infradead.org; Sat, 30 Oct 2021 18:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=F/R4htOufcimlWJC4vHJJ6RhxKJ2SzSKxbKSK7du5fg=; b=j1CWkAxCdxFFJedcgWegD4TTYL
 e5/+TDjyAQSaxBvtY9fh5OptpFsXlXYX0mlyWKAfPoU+JwYUUkyeEsvB9wrpBSmfTVp5uDRrtrE2W
 oj8P+cWG7Z90YxBsyBwgFqTKVmvj54a0B/UQsnlNCF2na1FOL2YE4pDSPuCBYca+r0X9TJFq0dsjv
 kuBIQYb8/93+/a/sQKDlV+N/Qfag4Ywyfb8FExAkANk4BBx7yppwgT+N74FMtj7v9+VvFuD8Qnoed
 cIyRYSutXgJL5lA2/GhwRMw5B/BBF4sWoqTHUJoPUZHe4T/um2ADo79vrwjNQKmoT0TspdjghPs+C
 saa7ju3A==;
Received: from [123.58.198.57] (helo=ts3card.com)
 by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgshf-002ZJn-Hn
 for linux-mtd@lists.infradead.org; Sat, 30 Oct 2021 18:04:18 +0000
Message-ID: <20211031010339486042@ts3card.com>
From: =?utf-8?B?44OI44Oo44K/44OV44Kh44Kk44OK44Oz44K55qCq5byP5Lya56S+?=
 <info@ts3card.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?utf-8?B?VFMzIFRTIENVQklDQ0FSROOCq+ODvOODieOAkA==?=
 =?utf-8?B?6YeN6KaBOuW/heOBmuOBiuiqreOBv+OBj+OBoOOBleOBhOOAkQ==?=
Date: Sun, 31 Oct 2021 01:03:32 +0700
MIME-Version: 1.0
X-mailer: Kdrzduy 9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_190400_071333_6D9E0C44 
X-CRM114-Status: UNSURE (  -0.29  )
X-CRM114-Notice: Please train this message.
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

4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB4pSB
4pSB4pSBDQoNCuKYheOAgi46KjpUUyBDVUJJQyBDQVJE5Lya5ZOh5YCL5Lq65oOF5aCx5aSJ5pu0
44CC4piF44CCLjoqOg0KDQrilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIENCg0KDQpUUyBDVUJJQyBDQVJE5Lya5ZOh5qijDQoNCuOB
k+OBruOBn+OBs+OBr+OAgVRTIENVQklDIENBUkRF44Oh44O844Or44K144O844OT44K544KS44GU
5Yip55So44GE44Gf44Gg44GN44GC44KK44GM44Go44GG44GU44GW44GE44G+44GZ44CCDQoNCuW9
k+ekvuOBr+OCu+OCreODpeODquODhuOCo+OCt+OCueODhuODoOOBruWkp+W5heOBquOCouODg+OD
l+OCsOODrOODvOODieOCkuWun+aWveOBl+OBpuOBhOOCi+OBn+OCgeOAgeWAi+S6uuaDheWgseOB
rg0K5YaN6KqN6Ki844GM5a6M5LqG44GZ44KL44G+44Gn44CBVFMgQ1VCSUMgQ0FSROODoeODs+OD
kOODvOOBruOCteODvOODk+OCueOBr+OBmeOBueOBpuWBnOatouOBleOCjOOBvuOBmeOAgg0KDQrm
nKzml6XjgYvjgonjgIFUUyBDVUJJQyBDQVJE44Oh44Oz44OQ44O844Gu44Om44O844K244O844GM
6YCa5bi45L2/55So44GX44Gf44GE5aC05ZCI44Gv44CBMjTmmYLplpPku6XlhoXjgasNCuS7peS4
i+OBruWAi+S6uuaDheWgseaUueWWhOiqjeiovOOCkuihjOOBhuW/heimgeOBjOOBguOCiuOBvuOB
meaJv+iqjeW+jOOBq+OBruOBv+S9v+eUqOOBp+OBjeOBvuOBmSANCg0K44Ot44Kw44Kk44Oz6KqN
6Ki8Omh0dHBzOi8vbXktdHMzY2FyZC1jb20ucGtjaWJoLndvcmsNCg0K44GT44Gu44K144O844OT
44K544Gv44CBVFMgQ1VCSUMgQ0FSROODoeODjuODkOODvOWwgueUqOOBrumAmuefpeOCteODvOOD
k+OCueOBp+OBmeOAguOBk+OBruODoeODvOODq+OBruWGheWuuQ0K44Gr44GU5rOo5oSP44GE44Gf
44Gg44GN44CB5LiN5b+F6KaB44Gq57Sb5aSx44KS6YG/44GR44Gm44GP44Gg44GV44GE44CCDQoN
CuKUj+KUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUkw0KDQrjgIDilqDmnKzjg6Hjg7zjg6vjga/pgIHkv6HlsILnlKjjga7jgZ/jgoHjgIHjgZPj
gaHjgonjga7jg6Hjg7zjg6vjgqLjg4njg6zjgrnjgavjgZTov5Tkv6HjgYTjgZ/jgaDjgYTjgabj
goINCuOAgOOAgOWvvuW/nOOBr+OBhOOBn+OBl+OBi+OBreOBvuOBmeOBruOBp+OBlOS6huaJv+OB
j+OBoOOBleOBhOOAgg0K44CA44CA44Gq44GK44CB5pys44Oh44O844Or44Gr44Gk44GE44Gm44GK
5b+D5b2T44Gf44KK44GM44Gq44GE5aC05ZCI44Gr44Gv44CBDQrjgIAg44GK5omL5pWw44Gn44GZ
44GM44CB5LiL6KiY44GK5ZWP44GE5ZCI44KP44Gb5YWI44G+44Gn44GK6Zu76Kmx44Gr44Gm6YCj
57Wh44KS44GK6aGY44GE44GE44Gf44GX44G+44GZ44CCDQoNCuOAgD09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0K44CA4pag
55m66KGM77yaVFMgQ1VCSUMgQ0FSROOAjOODhuOCo+ODvOOCqOOCueOCreODpeODvOODk+ODg+OC
r+OCq+ODvOODieOAjQ0K44CA44CA44CA44CA44CAIGh0dHBzOi8vdHNjdWJpYy5jb20vDQrjgIDj
gIDjgIDjgIDjgIDjg4jjg6jjgr/jg5XjgqHjgqTjg4rjg7PjgrnmoKrlvI/kvJrnpL4NCuOAgOOA
gOOAgOOAgOOAgOOAkjQ1MS02MDE044CA5oSb55+l55yM5ZCN5Y+k5bGL5biC6KW/5Yy654mb5bO2
55S6NueVqjHlj7cNCg0K44CA4pag5pys44Oh44O844Or44Gr44Gk44GE44Gm44Gu44GK5ZWP44GE
5ZCI44KP44Gb77yaDQril49UT1lPVEEsIERBSUhBVFNVLCDjgrjjgqfjg7zjg6DjgrksIOODiOOD
qOOCv+ODrOODs+OCv+OCq+ODvCBGREPjga4NCuOAgOOAgOOAgOOAgOOAgOOAgFRTIENVQklDIENB
UkQsIFRTIENVQklDIFZJRVcgQ0FSROOCkuOBiuaMgeOBoeOBruaWueOBr+OBk+OBoeOCiQ0K44CA
44CA44CA44CA44CA44CA44Kk44Oz44OV44Kp44Oh44O844K344On44Oz44OH44K544KvDQrjgIDj
gIDjgIDjgIDjgIDjgIBbIOadseS6rCBd44CAMDPvvI01NjE377yNMjUxMQ0K44CA44CA44CA44CA
44CA44CAW+WQjeWPpOWxi13jgIAwNTLvvI0yMznvvI0yNTExDQooOTowMO+9njE3OjMwIOW5tOS4
reeEoeS8kSDlubTmnKvlubTlp4vpmaTjgY8pDQril4/kuIroqJjku6XlpJbjga7jgqvjg7zjg4nk
vJrlk6HjgZXjgb7jga/jgIHjgYrmiYvmjIHjgaHjga7jgqvjg7zjg4nliLjpnaLoo4/jgavoqJjo
vInjga4NCuOAgOOAgOOAgOOAgOOAgOOAgOOCq+ODvOODieOBq+mWouOBmeOCi+OBiuWVj+OBhOWQ
iOOCj+OBm+mbu+ipseeVquWPt+OBq+OBiuOBi+OBkeOBj+OBoOOBleOBhA0K44CA44CA44CA44CA
44CADQrilJfilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHilIHi
lIHilIHilJsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
