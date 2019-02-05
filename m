Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E69DC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 15:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B32A2075D
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 15:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hh9Ld3Vv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B32A2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ginzinger.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=su68KrxJ81sg5JpbmCEgig7WVp+L1buM6uRHdBybLE0=; b=hh9
	Ld3Vv4FOm4zJ3fa5VmAPuNcJPY7Qylk7LjcB7Kn7lkJLD+vCpDnoSI9KqV8AyxrwGxjE09oXRpqDd
	JW49tOGDzzOCxO/Y131zpke5z0i9b/Ud4N0PnVLdfxmSKu+EO0SiMtrSIZXQqZmRB61pe6zoeIheR
	vi/eUda4ccrDNZQd9aG+yqRtefIyYR6HA5J6IVtup5ZSu288x3hTNRb0zPFlOVaET+Iamn+LGPqHH
	eTfG5Sh8/C011r6bhLFLrVqfHbRjcgynfWopBRBW9E+CFie6Z9TNbdpHneGyIb9vtavbnSvuAgvrk
	TK3v6kZjThKLxx24GeMvVHO+MtTcA8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr32F-0003Rb-Dl; Tue, 05 Feb 2019 15:53:19 +0000
Received: from mx-ginzinger.sigmacloud.services ([185.154.235.147])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr32B-0003RC-IB
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 15:53:17 +0000
Received: from [31.193.165.228] (port=56268
 helo=mx-ginzinger.sigmacloud.services)
 by mx-ginzinger.sigmacloud.services with esmtps
 (TLSv1.2:AES256-GCM-SHA384:256) (Exim 4.82_1-5b7a7c0-XX)
 (envelope-from <Martin.Kepplinger@ginzinger.com>)
 id 1gr324-0001TG-0i; Tue, 05 Feb 2019 16:53:08 +0100
Received: from martin-laptop.buero.ginzinger.com (10.10.1.120) by
 exc1.buero.ginzinger.com (10.1.1.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1466.3; Tue, 5 Feb 2019 16:53:07 +0100
X-CTCH-RefID: str=0001.0A0B020F.5C59B164.003F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
To: <han.xu@nxp.com>, <bbrezillon@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: rawnand: gpmi: fix MX28 bus master lockup problem
Date: Tue, 5 Feb 2019 16:52:51 +0100
Message-ID: <20190205155251.18733-1-martin.kepplinger@ginzinger.com>
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [10.10.1.120]
X-ClientProxiedBy: exc1.buero.ginzinger.com (10.1.1.204) To
 exc1.buero.ginzinger.com (10.1.1.204)
X-EXCLAIMER-MD-ORIGINAL-SUBJECT: [NOSIG][NODISC][PATCH v2] mtd: rawnand: gpmi:
 fix MX28 bus master lockup problem
X-EXCLAIMER-MD-CONFIG: 9dd172f7-de2e-4231-b886-ec11f46e03b3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_075315_909463_D608951D 
X-CRM114-Status: GOOD (  16.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============8204269816195771356=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an S/MIME signed message

--===============8204269816195771356==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----645B7DDDF3D3CB235BDF58241E93D10A"

This is an S/MIME signed message

------645B7DDDF3D3CB235BDF58241E93D10A
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Disable BCH soft reset according to MX23 erratum #2847 ("BCH soft
reset may cause bus master lock up") for MX28 too. It has the same
problem.

Observed problem: once per 100,000+ MX28 reboots NAND read failed on
DMA timeout errors:
[    1.770823] UBI: attaching mtd3 to ubi0
[    2.768088] gpmi_nand: DMA timeout, last DMA :1
[    3.958087] gpmi_nand: BCH timeout, last DMA :1
[    4.156033] gpmi_nand: Error in ECC-based read: -110
[    4.161136] UBI warning: ubi_io_read: error -110 while reading 64
bytes from PEB 0:0, read only 0 bytes, retry
[    4.171283] step 1 error
[    4.173846] gpmi_nand: Chip: 0, Error -1

Without BCH soft reset we successfully executed 1,000,000 MX28 reboots.

I have a quote from NXP regarding this problem, from July 18th 2016:

"As the i.MX23 and i.MX28 are of the same generation, they share many
characteristics. Unfortunately, also the erratas may be shared.
In case of the documented erratas and the workarounds, you can also
apply the workaround solution of one device on the other one. This have
been reported, but I’m afraid that there are not an estimated date for
updating the Errata documents.
Please accept our apologies for any inconveniences this may cause."

Fixes: 6f2a6a52560a ("mtd: nand: gpmi: reset BCH earlier, too, to avoid
NAND startup problems")
Cc: stable@vger.kernel.org
Signed-off-by: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---


revision history
----------------
v2: add Fixes tag, Cc stable and add recent Reviewed-by tags


 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index bd4cfac6b5aa..a4768df5083f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -155,9 +155,10 @@ int gpmi_init(struct gpmi_nand_data *this)
 
 	/*
 	 * Reset BCH here, too. We got failures otherwise :(
-	 * See later BCH reset for explanation of MX23 handling
+	 * See later BCH reset for explanation of MX23 and MX28 handling
 	 */
-	ret = gpmi_reset_block(r->bch_regs, GPMI_IS_MX23(this));
+	ret = gpmi_reset_block(r->bch_regs,
+			       GPMI_IS_MX23(this) || GPMI_IS_MX28(this));
 	if (ret)
 		goto err_out;
 
@@ -263,12 +264,10 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 	/*
 	* Due to erratum #2847 of the MX23, the BCH cannot be soft reset on this
 	* chip, otherwise it will lock up. So we skip resetting BCH on the MX23.
-	* On the other hand, the MX28 needs the reset, because one case has been
-	* seen where the BCH produced ECC errors constantly after 10000
-	* consecutive reboots. The latter case has not been seen on the MX23
-	* yet, still we don't know if it could happen there as well.
+	* and MX28.
 	*/
-	ret = gpmi_reset_block(r->bch_regs, GPMI_IS_MX23(this));
+	ret = gpmi_reset_block(r->bch_regs,
+			       GPMI_IS_MX23(this) || GPMI_IS_MX28(this));
 	if (ret)
 		goto err_out;
 
-- 
2.20.1


------645B7DDDF3D3CB235BDF58241E93D10A
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIOHAYJKoZIhvcNAQcCoIIODTCCDgkCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggshMIIF5jCCA86gAwIBAgIQapvhODv/K2ufAdXZuKdSVjANBgkq
hkiG9w0BAQwFADCBhTELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExp
bWl0ZWQxKzApBgNVBAMTIkNPTU9ETyBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3Jp
dHkwHhcNMTMwMTEwMDAwMDAwWhcNMjgwMTA5MjM1OTU5WjCBlzELMAkGA1UEBhMC
R0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9y
ZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBS
U0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+s55XrCh2dUAWxzgDmNPGGHYh
UPMleQtMtaDRfTpYPpynMS6n9jR22YRq2tA9NEjk6vW7rN/5sYFLIP1of3l0NKZ6
fLWfF2VgJ5cijKYy/qlAckY1wgOkUMgzKlWlVJGyK+UlNEQ1/5ErCsHq9x9aU/x1
KwTdF/LCrT03Rl/FwFrf1XTCwa2QZYL55AqLPikFlgqOtzk06kb2qvGlnHJvijjI
03BOrNpo+kZGpcHsgyO1/u1OZTaOo8wvEU17VVeP1cHWse9tGKTDyUGg2hJZjrqc
k39UIm/nKbpDSZ0JsMoIw/JtOOg0JC56VzQgBo7ictReTQE5LFLG3yQK+xS1AgMB
AAGjggE8MIIBODAfBgNVHSMEGDAWgBS7r34CPfqm8TyEjq3uOJjs2TIy1DAdBgNV
HQ4EFgQUgq9sjPjF/pZhfOgfPStxSF7Ei8AwDgYDVR0PAQH/BAQDAgGGMBIGA1Ud
EwEB/wQIMAYBAf8CAQAwEQYDVR0gBAowCDAGBgRVHSAAMEwGA1UdHwRFMEMwQaA/
oD2GO2h0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNlcnRpZmljYXRp
b25BdXRob3JpdHkuY3JsMHEGCCsGAQUFBwEBBGUwYzA7BggrBgEFBQcwAoYvaHR0
cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQWRkVHJ1c3RDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTANBgkqhkiG9w0BAQwF
AAOCAgEAeFyygSg0TzzuX1bOn5dW7I+iaxf28/ZJCAbU2C81zd9A/tNx4+jsQgwR
GiHjZrAYayZrrm78hOx7aEpkfNPQIHGG6Fvq3EzWf/Lvx7/hk6zSPwIal9v5IkDc
ZoFD7f3iT7PdkHJY9B51csvU50rxpEg1OyOT8fk2zvvPBuM4qQNqbGWlnhMpIMwp
WZT89RY0wpJO+2V6eXEGGHsROs3njeP9DqqqAJaBa4wBeKOdGCWn1/Jp2oY6dyNm
NppI4ZNMUH4Tam85S1j6E95u4+1Nuru84OrMIzqvISE2HN/56ebTOWlcrurffade
2022O/tUU1gb4jfWCcyvB8czm12FgX/y/lRjmDbEA08QJNB2729Y+io1IYO3ztve
BdvUCIYZojTq/OCR6MvnzS6X72HP0PRLRTiOSEmIDsS5N5w/8IW1Hva5hEFy6fDA
fd9yI+O+IMMAj1KcL/Zo9jzJ16HO5m60ttl1Enk8MQkz/W3JlHaeI5iKFn4UJu1/
cP2YHXYPiWf2JyBzsLBrGk1II+3yL8aorYew6CQvdVifC3HtwlSam9V1niiCfOBe
2C12TdKGu05LWIA3ZkFcWJGaNXOZ6Ggyh/TqvXG5v7zmEVDNXFnHn9tFpMpOUvxh
csjycBtH0dZ0WrNw6gH+HF8TIhCnH3+zzWuDN0Rk6h9KVkfKehIwggUzMIIEG6AD
AgECAhBNQrEzGzrZ6FVYh1EEYH4+MA0GCSqGSIb3DQEBCwUAMIGXMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxm
b3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RP
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAe
Fw0xODA3MTgwMDAwMDBaFw0yMTA3MTcyMzU5NTlaMDAxLjAsBgkqhkiG9w0BCQEW
H21hcnRpbi5rZXBwbGluZ2VyQGdpbnppbmdlci5jb20wggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDsMC77L0D+2D8I8X5ubnBhADLgU+HtlwMTFt/WJIhc
kgbvnawYXWrCIpk8F6BJ0R/iFCykPdG7741EmlcHRKOJfhVxjXhwnoGFqnYmurCt
fvZLR3+mT3FWnVv2RAdrXscXH3BpijqqWabdtTbiTvmcl86Zc6mNlVhYZSbDul/E
voIGZotGcGIWrgZxN+8MQJQHKb0KHyWlPVPkrjvEfOJHKKLFsBNSnNMR95Ijg3Sp
h8/8RG490/zRHflGzUlxDSlLyY9YJGzSdDzcFKoYcc4oaaUY5N3uhRna43TLUIQh
6ybt3DKVz1Pw/ikwYJrOsulJrVr3D8KVHdGxq7HYl7jnAgMBAAGjggHfMIIB2zAf
BgNVHSMEGDAWgBSCr2yM+MX+lmF86B89K3FIXsSLwDAdBgNVHQ4EFgQU/GtSUbHg
14sPDlmo27eQYwtjaS0wDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYD
VR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMEYGA1UdIAQ/MD0wOwYMKwYBBAGy
MQECAQMFMCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQv
Q1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NP
TU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmww
gYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5jb21vZG9j
YS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMCoG
A1UdEQQjMCGBH21hcnRpbi5rZXBwbGluZ2VyQGdpbnppbmdlci5jb20wDQYJKoZI
hvcNAQELBQADggEBAGEuG01K1tt5i3gUdQkYem/KpbJUYBZd43QwmoTa0TGXUiYq
b+g/TeGG9QQ1yq+73xOr8fu6oT2608C7EiJc6JmjTs485/OZmTqgYkrLfs71F1kB
3Z59WPf5aoR/pnn5vdfkkoO29V1cKPJR4z+iOG2hOlcK/dXrX8i6mnL5DGIe8l5n
udUPvIbUhbMavrDd6kwhs0oCjylwdKGlFkCpKMn3HPflfDeHuV9Z8Nrpeq/7+Pm0
I/fLPkaYlULASJoJCucMYcedY9rmuro9JhV+NuVXaqLIrQPc1vyKFeRuLHh84M6c
1h1DArdGTykXZUwjXnnHtuOtzjIAzkx2Ns43vEsxggK/MIICuwIBATCBrDCBlzEL
MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMT
NENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEE1CsTMbOtnoVViHUQRgfj4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZI
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwMjA1MTU1MzEw
WjAvBgkqhkiG9w0BCQQxIgQg3pBPmfS0gLkzOJmtPLp8cW96yi8zTAnoCfgyB7mm
JfkweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcN
AwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEA
YHuJOBZeeCt16hdSih1B7FQQddMP/1PyZ2Ec8jhEmiRVQmY1ByB+S2GfPddMWfGi
6GBkJ/Dg696oY0MmDkSqPlm5eb0S2p9aEdUSOtjxiaAulsc58vli+A4XcySSSM1J
z/MBSqhn2zksWoqHq58y/Ltn9OIRwu8WCCh1HIO8kJnEpYHM1KyNU16GjZUsphjV
fTDtfLbmTwtkTIFiZjIpjR69GXfsVU3R4FahItcxPw53Ysal4ROLKRoDl6+7AExc
Ozjj2fX1qPnrO7jxgROsr3ZZoEmCcfOndmzMHfZ/smyOLWTgE/K4qHAES1Pe65S3
VvYv60hsrXZFcz/u499cBA==

------645B7DDDF3D3CB235BDF58241E93D10A--



--===============8204269816195771356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8204269816195771356==--


