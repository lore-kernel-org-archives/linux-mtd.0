Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C735C001DB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 22:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U03ty05KwEUeYoXv64BsjLs8evHlV11KbDq2itnuOAU=; b=vePaf/gvFYwduAb70NKkXeqsuO
	pq8WT31RTWA28lEgvWcTm9thT3hGbalsfCN7aJTvo1gM8QExt5OMsD3anR+jEZj5erVsI+ENKOmWK
	MGBrB8FSFn2mbEGD48EUrkRlOnc9IA0rijCHsGj1+bqAnugndXmdRtHxTFf2amut1vqC4IDARtSrQ
	f+BIMGFDxO8h0VyQDcnH9ecwbM2rDikr5BWYaweHyYzPSscJXT2hjg0sbydaohPCdesSp6t/LhdeL
	TTTQx7gCy8adwKnQqaa9Ty9qah3CG/7Gvz7SfFZTvLKTKgl6u0oQogsvT17bN6CwzQ2curBoeSPsq
	/kdTfqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVG3-003ZVI-0O;
	Tue, 08 Aug 2023 22:32:55 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVG0-003ZUl-0W
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 22:32:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-686f19b6dd2so4349353b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 08 Aug 2023 15:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1691533968; x=1692138768;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=qZUUVwTv4zOZK/0O+CWgI2jzjxyYQ0zU2Q1rbltvrvI=;
        b=LS+eKRbOFeWjPztbVrhpQrstA+Wu4izdbRuEXDLAfIIO2lRjAr8pHhX5hvXA9xZXCf
         YTy9GaKp9cDpX3iVq4NaoAp+0YqDTiroOObHTMgJjbGeog/cfrJv0GMHuiDiU1uVdBQ0
         duIFvOt8cttMGdi0ZDS6L97ULINvWP0M7U0Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691533968; x=1692138768;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZUUVwTv4zOZK/0O+CWgI2jzjxyYQ0zU2Q1rbltvrvI=;
        b=dJgKcCAOmoBuJtN8Okyw2Sni8VU5QC7RaoBvuyCodrNS9HsQNtBAH92Xf2H0gGQ8mb
         +jscfErZhe3PD6y1UkRcnaiishFdRR8Ry85ATwM2tIJowSJ1PsFUyIEnYOn+zcIv3b75
         fYwhR6HOKTEEjk7lU0enXMndmmU1dtBZzEp1m0DNGyxG0xwHDt+jXdfhGunLQpCd/WI2
         d8TOdnaV+NqzA3utgOxRoOBEF8/FspAecmVmY6unxKM160Ml6nQ2guOMM1OrJInogAXf
         Gpb5NrF7gPbcm3tkjgtIvupfAcu5vM22Oia/lWs2ua09/NYKrUDZvB+oipkgeNTS9Zvs
         nQeQ==
X-Gm-Message-State: AOJu0YyYjchryzHjt4hVKVo/pI88hXpJaDbuXCLGdpNTs8AJ4TMMqleP
	X3To6PNeeRCS2+W4z0AmHnioLS5FS9vZMLLxXbQ=
X-Google-Smtp-Source: AGHT+IFs6H9vYMLGMG/b628m96jLwdV12g0IO1UA9hfAVSa/zCWw/+qypO2XwqfG++WANBNPFFSvFA==
X-Received: by 2002:a05:6a00:3a05:b0:687:472f:5150 with SMTP id fj5-20020a056a003a0500b00687472f5150mr746279pfb.8.1691533968596;
        Tue, 08 Aug 2023 15:32:48 -0700 (PDT)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78482000000b00666b3706be6sm8577268pfn.107.2023.08.08.15.32.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Aug 2023 15:32:47 -0700 (PDT)
Subject: Re: [PATCH -next v3 RESEND] mtd: rawnand: Propagate error and
 simplify ternary operators for brcmstb_nand_wait_for_completion()
To: Ruan Jinjie <ruanjinjie@huawei.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20230808032943.3890545-1-ruanjinjie@huawei.com>
From: William Zhang <william.zhang@broadcom.com>
Message-ID: <f287d050-09ca-467e-7cc6-e45ce9a701dc@broadcom.com>
Date: Tue, 8 Aug 2023 15:32:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20230808032943.3890545-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_153252_249547_FD194FFC 
X-CRM114-Status: GOOD (  22.86  )
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
Content-Type: multipart/mixed; boundary="===============2036971334171150924=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2036971334171150924==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005850dc060270f1ad"

--0000000000005850dc060270f1ad
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08/07/2023 08:29 PM, 'Ruan Jinjie' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> As bcmnand_ctrl_poll_status() return negative errno, so return true if
> sts < 0. The < 0 case does not exist for wait_for_completion_timeout(),
> so return true if sts = 0 and zero otherwise. Both of the true return
> of them can be considered as a -ETIMEDOUT err, so return -ETIMEDOUT
> if err is true to propagate err from its caller.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
> v3:
> - Update the commit title and message.
> - Do not change the return type from bool to int.
> - Return -ETIMEDOUT if err is true.
> v2:
> - Update the commit title and message.
> - Propagate the error instead of upon error.
> ---
>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 03764b589ec5..440bef477930 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -1666,13 +1666,13 @@ static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
>   		disable_ctrl_irqs(ctrl);
>   		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
>   					       NAND_CTRL_RDY, 0);
> -		err = (sts < 0) ? true : false;
> +		err = sts < 0;
>   	} else {
>   		unsigned long timeo = msecs_to_jiffies(
>   						NAND_POLL_STATUS_TIMEOUT_MS);
>   		/* wait for completion interrupt */
>   		sts = wait_for_completion_timeout(&ctrl->done, timeo);
> -		err = (sts <= 0) ? true : false;
> +		err = !sts;
>   	}
>   
>   	return err;
> @@ -1688,6 +1688,7 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
>   	if (ctrl->cmd_pending)
>   		err = brcmstb_nand_wait_for_completion(chip);
>   
> +	ctrl->cmd_pending = 0;
>   	if (err) {
>   		u32 cmd = brcmnand_read_reg(ctrl, BRCMNAND_CMD_START)
>   					>> brcmnand_cmd_shift(ctrl);
> @@ -1696,8 +1697,8 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
>   			"timeout waiting for command %#02x\n", cmd);
>   		dev_err_ratelimited(ctrl->dev, "intfc status %08x\n",
>   			brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS));
> +		return -ETIMEDOUT;
>   	}
> -	ctrl->cmd_pending = 0;
>   	return brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) &
>   				 INTFC_FLASH_STATUS;
>   }
> 

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--0000000000005850dc060270f1ad
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQcAYJKoZIhvcNAQcCoIIQYTCCEF0CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3HMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU8wggQ3oAMCAQICDDG6HZcbcVdEvVYk4TANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMTMxNDVaFw0yNTA5MTAxMTMxNDVaMIGQ
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFjAUBgNVBAMTDVdpbGxpYW0gWmhhbmcxKTAnBgkqhkiG9w0B
CQEWGndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAyKF+RmY29Wvfmfe3L8J4rZNmBIvRmrWKI5td5L0vlpPMCEzUkVhBdL2N9cDP0rPScvWL
CX/9cI1a2BUy/6/ZT5j9PhcUn6A3kwKFGukLY2itfKaDrP3ANVJGhBXPVJ6sx55GF41PkiL2EMnY
7LJGNpl9WHYrw8VqtRediPyXq8M6ZWGPZWxygsE6y1pOkEk9qLpvXTb2Epxk2JWcQFZQCDWVULue
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIGT03MVJmflroeTbLE+J+IENTG6c
5BH5+Yqa2sexi7wDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDgwODIyMzI0OFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQB6PWNp5WKz8/QXgWACcTKE3NOkolOjXTE7AtKb1hNL5wqG
5tZVtu/IXikQE1rQgNIiLHiH1IwWaH7+ByGtXE4odAJ0UeBAU2O3a14uMIeVa1DoKJBK6iIncY2T
hjuovEEpZGaX9Bhan9oVA8rtcy/fxnwbhHDI5XbX1rlGRz4JGag+FeZUsr61Qhj8YRCHQMPiANQP
yWQmoZFVFGPlWIi7QEFgIfvl53CLHAgGuk0ApxLWp77/qRoGJ20TNjRBnVOkB3Jf5b0NvvMdeVdP
dJ58TNS8S7/NCFqs1oUMx0cK76CqSZkqzanL9XYnzELwUv6uVxVev3ZDQNomqUQKFYQr
--0000000000005850dc060270f1ad--


--===============2036971334171150924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2036971334171150924==--

