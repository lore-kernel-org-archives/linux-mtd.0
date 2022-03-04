Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B29C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IcZk2OBlRHGBsCmkSmqWobewwpc+qzjxQXWIlMzD0+U=; b=jqqMhE6oKaTz3+
	gAX+kx8b84oLwmIfy2n9CBkqicOoJo4s6fvJR1vwwD7+bjd0NyMIQHomw33lxi13suG3Nh8EdNtW/
	D/pjqyT1Nx1ClOB3VNplDMHTF+fUYbrvOuKmUZV9fmFlMKBhbSw5TOdr0vmr7uV3WNfaKK+xfNPRt
	RDgnhiVxtHNJl4exXGBYeQro+/uwukLkwU7tcGp5ZkeeVfWvTi6+2cNDX5XS1/XocNYIykk3HWViY
	MotTKYIZ5NqjIlfpbXjzVuV5nnodvhQlvP3yJqaxp3GZnxNr7tMszE5CUzIf5dR+nV72o+baN2dsU
	c133DKD7cZoYrzB2VURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3pK-009Ast-Mu; Fri, 04 Mar 2022 09:02:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3Re-00947z-Se; Fri, 04 Mar 2022 08:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=xSb9867Aq8yhJfUQ3X0yBgbAM+G1jeY9Iy1cP6eWkoE=; b=cZsWrY/B1Dzv0H4zBkBNQ3ukwe
 LTnaNwcInMsNoll4ILOY+L/wrUgS732bQFf2H74uZmLBQ8HrdbcWz++CeI2pipHnf7WbpC8DKVl/m
 +GEQKcyttHz85JBBPullhxHrn0zeFKvVjMgiHcwK4D8qkosNXSOdbaaRqpdLrcnWoh3k17UvvWKGc
 dwJ30IeKa8ZVCzwELFOqvhOzjApKDkoM7ALVCHZG3gnGQczPGCcxf8Vgi7d8uFZBR2B1oTb1D6+L6
 hesRGHnqddOSy+ZRbfUCeRoimIbX9OGfFm5HHGR+oV2zPbIX0JiX6dNcqZqK+SRQdW04tiGiicOkN
 udCsN0IA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3Rb-00CS1T-Bq; Fri, 04 Mar 2022 08:37:49 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2245JNOH021192; 
 Fri, 4 Mar 2022 08:36:52 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ek8mxpp6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:52 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248XJ2V027393;
 Fri, 4 Mar 2022 08:36:50 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ek4k8124g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2248amEB47186186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:36:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AEAD42042;
 Fri,  4 Mar 2022 08:36:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73D0D42045;
 Fri,  4 Mar 2022 08:36:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:36:47 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 89B872200FD;
 Fri,  4 Mar 2022 09:36:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 00/11] spi: spi-mem: Add driver for Aspeed SMC controllers
Date: Fri,  4 Mar 2022 09:36:32 +0100
Message-Id: <20220304083643.1079142-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RFuuLzC8JejxWrm4oynsn6-IAqVUMeMt
X-Proofpoint-ORIG-GUID: RFuuLzC8JejxWrm4oynsn6-IAqVUMeMt
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_083747_631160_D82E2814 
X-CRM114-Status: GOOD (  30.57  )
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

SGksCgpUaGlzIHNlcmllcyBhZGRzIGEgbmV3IFNQSSBkcml2ZXIgdXNpbmcgdGhlIHNwaS1tZW0g
aW50ZXJmYWNlIGZvciB0aGUKQXNwZWVkIHN0YXRpYyBtZW1vcnkgY29udHJvbGxlcnMgb2YgdGhl
IEFTVDI2MDAsIEFTVDI1MDAgYW5kIEFTVDI0MDAKU29Dcy4KCiAqIEFTVDI2MDAgRmlybXdhcmUg
U1BJIE1lbW9yeSBDb250cm9sbGVyIChGTUMpCiAqIEFTVDI2MDAgU1BJIEZsYXNoIENvbnRyb2xs
ZXIgKFNQSTEgYW5kIFNQSTIpCiAqIEFTVDI1MDAgRmlybXdhcmUgU1BJIE1lbW9yeSBDb250cm9s
bGVyIChGTUMpCiAqIEFTVDI1MDAgU1BJIEZsYXNoIENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIp
CiAqIEFTVDI0MDAgTmV3IFN0YXRpYyBNZW1vcnkgQ29udHJvbGxlciAoYWxzbyByZWZlcnJlZCBh
cyBGTUMpCiAqIEFTVDI0MDAgU1BJIEZsYXNoIENvbnRyb2xsZXIgKFNQSSkKCkl0IGlzIGJhc2Vk
IG9uIHRoZSBjdXJyZW50IE9wZW5CTUMga2VybmVsIGRyaXZlciBbMV0sIHVzaW5nIGRpcmVjdGx5
CnRoZSBNVEQgU1BJLU5PUiBpbnRlcmZhY2UgYW5kIG9uIGEgcGF0Y2hzZXQgWzJdIHByZXZpb3Vz
bHkgcHJvcG9zZWQKYWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBBU1QyNjAwIG9ubHkuIFRoaXMgZHJp
dmVyIHRha2VzIGEgc2xpZ2h0bHkKZGlmZmVyZW50IGFwcHJvYWNoIHRvIGNvdmVyIGFsbCA2IGNv
bnRyb2xsZXJzLgoKSXQgZG9lcyBub3QgbWFrZSB1c2Ugb2YgdGhlIGNvbnRyb2xsZXIgcmVnaXN0
ZXIgZGlzYWJsaW5nIEFkZHJlc3MgYW5kCkRhdGEgYnl0ZSBsYW5lcyBiZWNhdXNlIGlzIG5vdCBh
dmFpbGFibGUgb24gdGhlIEFTVDI0MDAgU29DLiBXZSBjb3VsZAppbnRyb2R1Y2UgYSBzcGVjaWZp
YyBoYW5kbGVyIGZvciBuZXcgZmVhdHVyZXMgYXZhaWxhYmxlIG9uIHJlY2VudCBTb0NzCmlmIG5l
ZWRlZC4gQXMgdGhlcmUgaXMgbm90IG11Y2ggZGlmZmVyZW5jZSBvbiBwZXJmb3JtYW5jZSwgdGhl
IGRyaXZlcgpjaG9vc2VzIHRoZSBjb21tb24gZGVub21pbmF0b3I6ICJVc2VyIG1vZGUiIHdoaWNo
IGhhcyBiZWVuIGhlYXZpbHkKdGVzdGVkIGluIFsxXS4gIlVzZXIgbW9kZSIgaXMgYWxzbyB1c2Vk
IGFzIGEgZmFsbCBiYWNrIG1ldGhvZCB3aGVuCmZsYXNoIGRldmljZSBtYXBwaW5nIHdpbmRvdyBp
cyB0b28gc21hbGwuCgpQcm9ibGVtcyB0byBhZGRyZXNzIHdpdGggc3BpLW1lbSB3ZXJlIHRoZSBj
b25maWd1cmF0aW9uIG9mIHRoZSBtYXBwaW5nCndpbmRvd3MgYW5kIHRoZSBjYWxpYnJhdGlvbiBv
ZiB0aGUgcmVhZCB0aW1pbmdzLiBUaGUgZHJpdmVyIGhhbmRsZXMKdGhlbSBpbiB0aGUgZGlyZWN0
IG1hcHBpbmcgaGFuZGxlciB3aGVuIHNvbWUga25vd2xlZGdlIG9uIHRoZSBzaXplIG9mCnRoZSBm
bGFzaCBkZXZpY2UgaXMga25vdy4gSXQgaXMgbm90IHBlcmZlY3QgYnV0IG5vdCBpbmNvcnJlY3Qg
ZWl0aGVyLgpUaGUgYWxnb3JpdGhtIGlzIG9uZSBmcm9tIFsxXSBiZWNhdXNlIGl0IGRvZXNuJ3Qg
cmVxdWlyZSB0aGUgRE1BCnJlZ2lzdGVycyB3aGljaCBhcmUgbm90IGF2YWlsYWJsZSBvbiBhbGwg
Y29udHJvbGxlcnMuCgpEaXJlY3QgbWFwcGluZyBmb3Igd3JpdGVzIGlzIG5vdCBzdXBwb3J0ZWQg
KHlldCkuIEkgaGF2ZSBzZWVuIHNvbWUKY29ycnVwdGlvbiB3aXRoIHdyaXRlcyBhbmQgSSBwcmVm
ZXJyZWQgdG8gdXNlIHRoZSBzYWZlciBhbmQgcHJvdmVuCm1ldGhvZCBvZiB0aGUgaW5pdGlhbCBk
cml2ZXIgWzFdLiBXZSBjYW4gaW1wcm92ZSB0aGF0IGxhdGVyLgoKVGhlIGRyaXZlciBzdXBwb3J0
cyBRdWFkIFNQSSBSWCB0cmFuc2ZlcnMgb24gdGhlIEFTVDI2MDAgU29DIGJ1dCBpdApkaWRuJ3Qg
aGF2ZSB0aGUgZXhwZWN0ZWQgcmVzdWx0cy4gVGhlcmVmb3JlIGl0IGlzIG5vdCBhY3RpdmF0ZWQg
eWV0LgpUaGVyZSBhcmUgc29tZSBpc3N1ZXMgb24gdGhlIHBpbmN0cmwgdG8gaW52ZXN0aWdhdGUg
Zmlyc3QuIAoKVGhlIHNlcmllcyBkb2VzIG5vdCByZW1vdmUgdGhlIGN1cnJlbnQgQXNwZWVkIFNN
QyBkcml2ZXIgYnV0IHByZXBhcmVzCmdyb3VuZCBmb3IgaXRzIHJlbW92YWwgYnkgY2hhbmdpbmcg
aXRzIENPTkZJRyBvcHRpb24uIFRoaXMgbGFzdCBzdGVwCmNhbiBiZSBhZGRyZXNzZWQgYXMgYSBm
b2xsb3d1cCB3aGVuIHRoZSBuZXcgZHJpdmVyIHVzaW5nIHRoZSBzcGktbWVtCmludGVyZmFjZSBo
YXMgYmVlbiBzdWZmaWNpZW50bHkgZXhwb3NlZC4gCgpUZXN0ZWQgb246CiAKICogT3BlblBPV0VS
IFBhbG1ldHRvIChBU1QyNDAwKQogKiBGYWNlYm9vayBXZWRnZSAxMDAgQk1DIChBU1QyNDAwKSBi
eSBUYW8gUmVuIDxyZW50YW8uYnVwdEBnbWFpbC5jb20+CiAqIEV2YWx1YXRpb24gYm9hcmQgKEFT
VDI1MDApIAogKiBJbnNwdXIgRlA1MjgwRzIgQk1DIChBU1QyNTAwKSBieSBKb2huIFdhbmcgPHdh
bmd6cS5qbkBnbWFpbC5jb20+CiAqIEZhY2Vib29rIEJhY2twYWNrIENNTSBCTUMgKEFTVDI1MDAp
IGJ5IFRhbyBSZW4gPHJlbnRhby5idXB0QGdtYWlsLmNvbT4KICogT3BlblBPV0VSIFdpdGhlcnNw
b29uIChBU1QyNTAwKQogKiBFdmFsdWF0aW9uIGJvYXJkIChBU1QyNjAwIEEwIGFuZCBBMykKICog
UmFpbmllciBib2FyZCAoQVNUMjYwMCkKIApbMV0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
bGludXgvYmxvYi9kZXYtNS4xNS9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2FzcGVl
ZC1zbWMuYwpbMl0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWFz
cGVlZC9saXN0Lz9zZXJpZXM9MjEyMzk0CgpUaGFua3MsCgpDLiAKCkNoYW5nZXMgaW4gdjM6Cgog
LSBGaXhlZCBjb21waWxlIHdhcm5pbmcgb24gYXNwZWVkX3NwaV9kaXJtYXBfcmVhZCgpIHByb3Rv
dHlwZSByZXBvcnRlZAogICBieSBrZXJuZWwgdGVzdCByb2JvdCAKIC0gUmVtb3ZlZCB1bm5lY2Vz
c2FyeSBlbnRyeSBpbiBhc3QyNjAwLWZtYy55YW1sCiAtIE5ldyBwYXRjaCBmcm9tIFRhbyB0byBz
ZXQgc3BpLW1heC1mcmVxdWVuY3kgb24gYWxsIEZNQyBkZXZpY2VzCgpDaGFuZ2VzIGluIHYyOgoK
IC0gRml4ZWQgZHRfYmluZGluZ19jaGVjayB3YXJuaW5ncyAoUm9iKQogLSBOZXcgZW50cnkgaW4g
TUFJTlRBSU5FUlMgCiAtIEFkZHJlc3NlZCBMdWthcyBjb21tZW50cyByZWdhcmRpbmcgdGhlIFNQ
SSBjb250cm9sbGVyIHJlZ2lzdHJhdGlvbgogICBhbmQgZGV2aWNlIHJlbW92YWwuIENoZWNrZWQg
d2l0aCBkcml2ZXIgYmluZC91bmJpbmQgICAKIC0gSW50cm9kdWNlZCBzZXR1cCBhbmQgY2xlYW51
cCBoYW5kbGVycyBhbmQgcmVtb3ZlZCByb3V0aW5lIGxvb3BpbmcKICAgb24gdGhlIERUIGNoaWxk
cmVuIHByb3BlcnRpZXMgKFByYXR5dXNoKQogLSBDbGFyaWZpZWQgaW4gY29tbWl0IGxvZyByZXF1
aXJlbWVudHMgZm9yIHRyYWluaW5nLgogLSBSZW1vdmVkIGRlZmNvbmZpZyBjaGFuZ2VzIG9mIHBh
dGNoIDEgc2luY2UgdGhleSB3ZXJlIHJldmVydGVkIGluCiAgIHRoZSBsYXN0IHBhdGNoIChKb2Vs
KQoKQ8OpZHJpYyBMZSBHb2F0ZXIgKDEwKToKICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogUmVuYW1l
IEtjb25maWcgb3B0aW9uCiAgQVJNOiBkdHM6IGFzcGVlZDogQWRqdXN0ICJyZWciIHByb3BlcnR5
IG9mIEZNQy9TUEkgY29udHJvbGxlcnMKICBkdC1iaW5kaW5nczogc3BpOiBBZGQgQXNwZWVkIFNN
QyBjb250cm9sbGVycyBkZXZpY2UgdHJlZSBiaW5kaW5nCiAgc3BpOiBzcGktbWVtOiBBZGQgZHJp
dmVyIGZvciBBc3BlZWQgU01DIGNvbnRyb2xsZXJzCiAgc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0
IGZvciBkaXJlY3QgbWFwcGluZwogIHNwaTogYXNwZWVkOiBBZGp1c3QgZGlyZWN0IG1hcHBpbmcg
dG8gZGV2aWNlIHNpemUKICBzcGk6IGFzcGVlZDogV29ya2Fyb3VuZCBBU1QyNTAwIGxpbWl0YXRp
b25zCiAgc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0IGZvciB0aGUgQVNUMjQwMCBTUEkgY29udHJv
bGxlcgogIHNwaTogYXNwZWVkOiBDYWxpYnJhdGUgcmVhZCB0aW1pbmdzCiAgQVJNOiBkdHM6IGFz
cGVlZDogRW5hYmxlIER1YWwgU1BJIFJYIHRyYW5zZmVycwoKVGFvIFJlbiAoMSk6CiAgQVJNOiBk
dHM6IGFzcGVlZC1nNDogU2V0IHNwaS1tYXgtZnJlcXVlbmN5IGZvciBhbGwgZmxhc2hlcwoKIGRy
aXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgICAgICAgICAgICAgICAgICB8IDExODQgKysrKysr
KysrKysrKysrKysKIC4uLi9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwgICAg
ICB8ICAgODcgKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMTAgKwogYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgICAgICAgICAgICAg
IHwgICAxNiArLQogYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kgICAgICAgICAgICAg
IHwgICAxNiArLQogYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kgICAgICAgICAgICAg
IHwgICAxNyArLQogZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnICAgICAg
IHwgICAgNCArLQogZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9NYWtlZmlsZSAgICAg
IHwgICAgMiArLQogZHJpdmVycy9zcGkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAxMSArCiBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgICAxICsKIDEwIGZpbGVzIGNoYW5nZWQsIDEzMjkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
YXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
